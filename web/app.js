'use strict';
const $ = id => document.getElementById(id);
const token = document.querySelector('meta[name="rccar-token"]').content;
const client = crypto.randomUUID();
let seq = 0, state = null, busy = false, keyboard = new Set(), pointer = null;
const control = {throttle:0,steering:0,speed:30,lights:false,horn:false,led1:false,led2:false,extra:false};
const names = {disconnected:'Desconectado',pairing:'Buscando carrinhos…',selecting:'Escolha um carrinho',ready:'Pareado',stopping:'Parando…',error:'Falha na conexão'};
const directions = [...document.querySelectorAll('.direction')];
const connected = () => state?.state === 'ready' && state.owner === client;
function error(text) { $('error').textContent = text; $('error').hidden = !text; }
async function post(action, data) {
  const body = {action,client,seq:++seq};
  if (action==='select') body.car_id=data;
  else if (data) body.control = {...data};
  const response = await fetch('/api/action',{method:'POST',headers:{'Content-Type':'application/json','X-RCCar-Token':token},body:JSON.stringify(body),signal:AbortSignal.timeout(2000)});
  const result = await response.json();
  if (!response.ok) throw new Error(result.error || 'Falha no comando.');
  return result;
}
function resetInput() {
  keyboard.clear(); pointer = null;
  control.throttle=0;control.steering=0;control.horn=false;control.extra=false;
  document.querySelectorAll('.held').forEach(el=>el.classList.remove('held'));
  paintMotion();
}
function paintMotion() {
  const t = control.throttle, s = control.steering;
  $('motion-label').textContent = [t>0?'Frente':t<0?'Ré':'',s<0?'Esquerda':s>0?'Direita':''].filter(Boolean).join(' + ') || 'Em repouso';
  document.body.classList.toggle('moving',Boolean(t));
  directions.forEach(el=>el.classList.toggle('held',connected() && t===Number(el.dataset.t) && s===Number(el.dataset.s) && Boolean(t||s)));
}
function stop() {
  resetInput();
  for(const key of ['lights','led1','led2']) {control[key]=false;$(key).checked=false;}
  if (state?.owner===client) post('stop').catch(e=>error(e.message));
}
async function sendControl() {
  if (!connected() || busy) return;
  busy=true;
  try {await post('control',control);}
  catch(e) {resetInput();if(!e.message.includes('antigo')) error(e.message);}
  finally {busy=false;}
}
function release() { if(pointer===null) return; resetInput(); sendControl(); }
function hold(el, start) {
  el.addEventListener('pointerdown',event=>{
    if(!connected() || event.button!==0) return;
    event.preventDefault();resetInput();pointer=event.pointerId;el.setPointerCapture(event.pointerId);
    start();el.classList.add('held');paintMotion();sendControl();
  });
  ['pointerup','pointercancel','lostpointercapture'].forEach(type=>el.addEventListener(type,release));
  el.addEventListener('click',event=>{
    if(event.detail!==0 || !connected())return;
    resetInput();start();paintMotion();sendControl();setTimeout(()=>{resetInput();sendControl();},300);
  });
}
directions.forEach(el=>hold(el,()=>{control.throttle=Number(el.dataset.t);control.steering=Number(el.dataset.s);}));
hold($('horn'),()=>{control.horn=true;});hold($('extra'),()=>{control.extra=true;});
$('stop').onclick=$('stop-center').onclick=stop;
$('connect').onclick=async()=>{error('');resetInput();$('connect').disabled=true;try{await post('connect');await status();}catch(e){error(e.message);$('connect').disabled=false;}};
$('disconnect').onclick=async()=>{resetInput();try{await post('disconnect');await status();}catch(e){error(e.message);}};
$('choose-car').onclick=async()=>{error('');try{await post('select',$('car-choice').value);await status();}catch(e){error(e.message);}};
$('speed').oninput=()=>{control.speed=Number($('speed').value);$('speed-value').value=control.speed;sendControl();};
for(const key of ['lights','led1','led2']) $(key).onchange=()=>{control[key]=$(key).checked;sendControl();};
const keys={KeyW:'up',ArrowUp:'up',KeyS:'down',ArrowDown:'down',KeyA:'left',ArrowLeft:'left',KeyD:'right',ArrowRight:'right'};
function keyboardMotion(){control.throttle=Number(keyboard.has('up'))-Number(keyboard.has('down'));control.steering=Number(keyboard.has('right'))-Number(keyboard.has('left'));paintMotion();sendControl();}
window.addEventListener('keydown',e=>{
  if(e.code==='Space'||e.code==='Escape'){if(connected()){e.preventDefault();stop();}return;}
  if(!connected() || /INPUT|TEXTAREA|SELECT/.test(e.target.tagName) || !keys[e.code])return;
  e.preventDefault();keyboard.add(keys[e.code]);keyboardMotion();
});
window.addEventListener('keyup',e=>{if(keys[e.code]){keyboard.delete(keys[e.code]);keyboardMotion();}});
window.addEventListener('blur',()=>{if(connected())stop();});
document.addEventListener('visibilitychange',()=>{if(document.hidden&&connected())stop();});
window.addEventListener('pagehide',()=>{
  if(state?.owner===client)fetch('/api/action',{method:'POST',keepalive:true,headers:{'Content-Type':'application/json','X-RCCar-Token':token},body:JSON.stringify({action:'disconnect',client,seq:++seq})}).catch(()=>{});
});
async function status(){
  try {
    const response=await fetch('/api/status',{signal:AbortSignal.timeout(1500)});
    if(!response.ok)throw new Error('Servidor indisponível.');
    state=await response.json();
    const own=state.owner===client, ready=connected(), other=state.owner&&!own;
    $('demo').hidden=!state.simulated;
    $('status').textContent=(state.simulated?'Simulação · ':'')+names[state.state]+(other?' · outra aba':'');
    $('status-dot').className='status-dot '+state.state;
    $('connection-hint').textContent=state.state==='ready'?'Pareamento confirmado. Segure os comandos para testar.':state.state==='pairing'?'Descobrindo o identificador nas respostas ao pareamento…':state.state==='selecting'?'Vários carrinhos responderam. Escolha um ID ou cancele e deixe apenas o desejado ligado.':state.state==='stopping'?'Transmitindo neutro e encerrando a sessão…':'Ligue apenas o carrinho desejado, com a luz piscando, e feche o app no celular.';
    $('connect').disabled=['ready','pairing','selecting','stopping'].includes(state.state);
    $('disconnect').disabled=!own||!['ready','pairing','selecting'].includes(state.state);
    $('car-picker').hidden=state.state!=='selecting';
    $('car-choice').disabled=$('choose-car').disabled=!own||state.state!=='selecting';
    const choices=state.candidates||[];
    if(JSON.stringify(choices)!==$('car-choice').dataset.choices){
      const selected=$('car-choice').value;
      $('car-choice').replaceChildren(...choices.map(id=>new Option('Carrinho '+id,id)));
      if(choices.includes(selected))$('car-choice').value=selected;
      $('car-choice').dataset.choices=JSON.stringify(choices);
    }
    [...directions,$('stop'),$('stop-center'),$('speed'),$('horn'),$('extra'),$('lights'),$('led1'),$('led2')].forEach(el=>el.disabled=!ready);
    $('car-id').textContent=state.car_id;$('controller-id').textContent=state.controller_id;
    $('packet').textContent=state.packet||'Nenhum pacote enviado.';
    $('events').replaceChildren(...state.events.slice().reverse().map(item=>{const li=document.createElement('li');li.textContent=item.time+' · '+item.message;return li;}));
    if(state.error) error(state.error);
    if(!ready){
      resetInput();
      for(const key of ['lights','led1','led2']){control[key]=false;$(key).checked=false;}
    }
  }catch(e){resetInput();state=null;document.querySelectorAll('button,input,select').forEach(el=>el.disabled=true);$('status').textContent='Servidor indisponível';error('Sem comunicação com o servidor. O comando expira automaticamente.');}
}
setInterval(sendControl,120);setInterval(status,500);status();
