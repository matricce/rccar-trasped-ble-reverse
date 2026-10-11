# RCCar — painel local de teste

Interface web com descoberta automática do ID de cada carrinho. O servidor Python
usa o Bluetooth deste computador (Linux/BlueZ) para transmitir os anúncios BLE
recuperados do app RCCar. A página se comunica com o servidor local por HTTP.

## Iniciar

```sh
/usr/bin/python3 web/server.py
```

Abra <http://127.0.0.1:8767>. O Python do sistema precisa de `dbus-python` e
PyGObject (`gi`); ambos já estão disponíveis nesta máquina. O adaptador precisa
estar ligado e oferecer anúncios BLE. O servidor escuta apenas no computador
local; não requer instalação de pacotes npm.

1. Ligue apenas o carrinho desejado, com a luz piscando, e feche o aplicativo no celular.
2. Mantenha as rodas suspensas nos primeiros testes e clique em **Conectar carrinho**.
3. Segure uma direção, uma diagonal, ou use **WASD / setas**. Solte para voltar ao neutro.
4. **Espaço**, **Esc** ou **Parar agora** zeram os comandos e as luzes.
5. **Desconectar** transmite neutro por 2,5 segundos antes de encerrar.

O painel obtém o ID na resposta ao pareamento; não depende do ID `F9 85 B7`
do primeiro teste. Se vários carrinhos responderem na janela de descoberta,
apresenta seus IDs para seleção e mantém os comandos de movimento bloqueados.
Sem conhecer os IDs, cancele e repita com apenas um ligado. A seleção expira
em 30 segundos. Cada busca usa uma nova identidade de controlador e valida o
checksum e a identidade devolvida, rejeitando respostas de buscas antigas.
Cancelar antes de selecionar um destino apenas encerra os anúncios de pareamento.

Velocidade: escala do protocolo de 0 a 100, começando em 30. Há controles para
luz principal, duas luzes auxiliares, buzina e uma função extra de efeito ainda
desconhecido. Frente e ré foram confirmadas fisicamente; os demais efeitos
ainda precisam ser validados neste carrinho. “Pareado” confirma a resposta
inicial, sem representar telemetria contínua do motor ou da bateria.

O navegador renova o comando a cada 120 ms. Se ficar sem renovação por 400 ms,
o servidor coloca movimento, buzina e função extra em neutro. Após 5 segundos
sem comunicação, encerra a sessão com neutro. Perder foco ou ocultar a página
também solicita parada. Esses mecanismos dependem de o servidor e o Bluetooth
continuarem funcionando; não constituem confirmação de parada física.

## Simulação e testes

```sh
/usr/bin/python3 web/server.py --simulate --port 8766
/usr/bin/python3 -m unittest discover -s tests -v
```

A simulação não acessa o Bluetooth nem aciona o carrinho. Os testes verificam
os pacotes observados no teste físico, expiração dos comandos, parada,
desconexão e rejeição de comandos antigos ou de outra aba.

Para restringir a busca a um ID já identificado: `--car-id aabbcc`.
Sem essa opção, a descoberta é automática. Encerre com `Ctrl+C`.
Detalhes da engenharia reversa e evidências estão em
[docs/analise-rccar.md](docs/analise-rccar.md).
