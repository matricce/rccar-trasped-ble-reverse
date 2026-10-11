# Análise do RCCar para controle com ESP32

Análise estática e testes de rádio realizados em 11/10/2026. O aplicativo implementa BLE por conexão GATT e por anúncios não conectáveis. **O carrinho respondeu ao pareamento e o usuário confirmou que as rodas giraram e pararam na sequência de comandos de frente/ré enviada pelo computador.** Isso valida o transporte por anúncios e o acionamento/parada dos motores neste modelo. A direção física de cada pulso e a velocidade não foram medidas separadamente. O firmware ESP32 ainda não foi implementado ou testado.

## Resultado do teste real com o Bluetooth do computador

O adaptador BlueZ da máquina suporta papéis central e periférico e anúncios BLE. Uma varredura inicial não encontrou candidato; após enviar o pedido de pareamento recuperado do app, surgiu a resposta:

```text
Pedido:   04 06 00 00 00 9B DD E0 00 00 00 00 00 00 00 00 00 00 4D
Resposta: 04 0A F9 85 B7 9B DD E0 00 00 00 00 00 00 00 00 00 00 8A
```

- Identificador temporário do controlador: `9B DD E0`, gerado para este teste.
- Identificador retornado pelo carrinho: `F9 85 B7`.
- Endereço BLE observado: `66:66:A1:B7:85:F9`; não se presume estabilidade após reinicialização.
- O tipo `04`, a operação de resposta `0A`, a repetição do identificador do controlador e ambos os checksums conferem.
- Não foi estabelecida conexão GATT: o teste foi uma troca de anúncios BLE.
- Não foram enviados comandos de movimento. O estado do carrinho após ausência de anúncios e a persistência do pareamento ainda não foram medidos.
- Ao encerrar, o computador mostrou `Discovering: no` e `ActiveInstances: 0`. O carrinho já não estava no cache de dispositivos quando consultado novamente; isso não invalida a resposta capturada.

Registro: `analysis/evidence/live-pairing-test.json`. Scripts: `tools/scan_rccar.py` e `tools/probe_pairing.py` (Python do sistema com dbus-python e PyGObject). O segundo envia somente operação `06`, com duração limitada, e encerra sua varredura/anúncio ao terminar.

### Primeiro teste de movimento enviado

Com autorização do usuário e confirmação de rodas suspensas, foi executado `tools/test_movement.py`: neutro por 1 s, frente por 0,6 s, neutro por 2 s, ré por 0,6 s, neutro por 3 s. BlueZ aceitou todos os anúncios e o processo terminou normalmente. **O usuário relatou ausência de movimento.** Depois apertou o botão do carrinho, as luzes voltaram a piscar e levantou a possibilidade de ele estar desligado. O estado de alimentação não foi verificado independentemente. Registro em `analysis/evidence/live-movement-test.json`.

O teste foi repetido com um identificador de controlador novo (`91 43 14`), e a transmissão de movimento foi condicionada a uma nova resposta de pareamento válida. O carrinho respondeu `04 0A F9 85 B7 91 43 14 ... EA`; a sequência de pulsos e neutro foi enviada e encerrada. **O usuário confirmou: “Sim, giraram e pararam”.** Registro em `analysis/evidence/live-movement-test-2.json`. A combinação de reativar o carrinho e renovar o pareamento resolveu o teste, mas não isolamos qual dessas alterações era necessária.

Pacotes do teste confirmado:

```text
Frente: 04 07 F9 85 B7 91 43 14 01 1E 01 64 00 00 02 00 00 00 9F
Ré:     04 07 F9 85 B7 91 43 14 02 1E 00 64 00 00 04 00 00 00 9B
Neutro: 04 07 F9 85 B7 91 43 14 00 00 00 64 00 00 05 00 00 00 86
```

Esses bytes incluem identificadores e contador daquela sessão. Para repetir, o script faz um novo pareamento; não pressupõe que uma sessão antiga continue válida. O LED parar de piscar, isoladamente, ainda não foi estabelecido como indicador de desligamento ou pareamento.

### Quarto carrinho (`AE 96 C4`): resposta com checksum diferente

Capturado em teste ao vivo no mesmo dia, com a ferramenta `tools/diag_scan.py` (escuta e classifica todo anúncio BLE, não só o formato esperado). O carrinho respondeu ao pedido de pareamento com estrutura correta — tipo `04`, operação `0A`, eco da identidade do controlador — porém checksum `35` onde o cálculo com semente `E9` esperava `0C`. O servidor antigo exigia esse checksum na resposta e descartava o carrinho silenciosamente; por isso as buscas terminavam vazias.

A exigência foi removida do `web/server.py` e de `tools/test_movement.py` alinhando ao app oficial: a desmontagem de `calDataIsTrue` mostra que a recepção valida apenas comprimento, tipo, operação e o eco da identidade aleatória do controlador (gerada a cada busca, proteção mais forte que checksum). O checksum com semente `E9` é usado só para transmitir. Nos três primeiros carrinhos a resposta coincidentemente validava.

Diferenças adicionais deste exemplar, relatadas pelo usuário e ainda não medidas:

- Precisa de alguns segundos ligado antes de aceitar pareamento; os outros três aceitam imediatamente. Hipótese: firmware de revisão diferente (o checksum divergente já evidencia isso) com inicialização mais lenta, ou uma janela inicial em que escuta o controle físico dedicado antes de entrar em modo de pareamento BLE.
- Nas sondas seguintes à primeira resposta, não respondeu mais — consistente com sair do modo de pareamento ou travar no primeiro controlador que respondeu. Religar o carrinho restaura o modo de pareamento.

Foram conferidos `SetForward`, `SetBackward`, `BuildControlData`, `ProcessBroadcastConnection` e a função de manipulação de bits no ARM64:

- Payload offset 8: bit 0 para frente, bit 1 para ré; ambos zerados no neutro.
- Offset 9: magnitude de velocidade; usado `30` (`1E` hexadecimal) no teste.
- Offset 10: o método `SetForward` também ativa bit 0; função física desse bit extra ainda não isolada.
- Offset 11: `100` (`64` hexadecimal), conforme o valor de `data4` montado pelo app.
- Offset 14: contador; valores 1 a 5 nesta sequência.
- Offset 18: checksum XOR já validado no pareamento.

O teste não confirma que a velocidade mecânica corresponde a 30% da máxima. O intervalo de anúncios de 50 ms foi solicitado ao BlueZ, mas não medido por captura de rádio.

## Material analisado e limites

- Pacote: `com.DeliMiniChe.carapp`, RCCar.
- Versão baixada: `202606301712`, versionCode `38`, ARM64.
- Origem: APKPure, obtida a partir da busca pelo identificador fornecido. Não foi extraída do telefone do usuário nem comparada à assinatura da instalação dele.
- XAPK SHA-256: `80eda9496a7f08857ec79f31498fcb99292de74fd5bf1ceb8b7077ca23f3b76a`.
- Unity `2022.3.62f3c1`, IL2CPP; metadados identificados pelo Cpp2IL como versão 31.1.
- Ferramentas: JADX 1.5.6, Cpp2IL 2022.1.0-pre-release.21, GNU objdump e leitura dos metadados.
- O APK não foi instalado ou executado. Após a análise estática, houve o teste de pareamento descrito acima.
- O usuário informa controle escrito “trasped” e que o app exige Bluetooth. A revisão da placa permanece desconhecida; o teste validou o caminho por anúncios BLE.

Os arquivos originais e extraídos estão em `analysis/`. Hashes e procedência estão em `analysis/evidence/provenance.json`. Os arquivos grandes foram excluídos do versionamento por `.gitignore`.

## 1. Transporte por anúncios BLE — confirmado no código

Arquivo Java: `analysis/jadx/sources/com/sthjd/mylibrary/HjdUnityBluetoothLE.java`.

`androidStartAdvertising(byte[])` usa:

```java
new AdvertiseSettings.Builder()
    .setAdvertiseMode(2)
    .setTxPowerLevel(3)
    .setTimeout(0)
    .setConnectable(false);

new AdvertiseData.Builder()
    .setIncludeDeviceName(false)
    .setIncludeTxPowerLevel(false)
    .addManufacturerData(0, payload);
```

O identificador de fabricante usado pela API é `0x0000`. Não é uma identificação confiável da marca do brinquedo. O telefone anuncia dados; nesse caminho, o carrinho precisa recebê-los por varredura BLE. O pareamento é feito pelo protocolo do aplicativo, não necessariamente pelo menu Bluetooth do Android.

O receptor Java procura registros começando por `16 FF` em hexadecimal: comprimento AD de 22 bytes seguido do tipo Manufacturer Specific Data. Encaminha o registro em Base64 à lógica Unity. O Base64 é apenas transporte interno Java–Unity, não a codificação transmitida pelo rádio.

Para o bloco de 19 bytes encontrado, a estrutura AD de fabricante tem esta forma:

```text
16 FF 00 00 [payload de 19 bytes]
│  │  └──── identificador de fabricante, little-endian
│  └─────── tipo AD: Manufacturer Specific Data
└────────── comprimento após este byte: 22
```

Essa estrutura pode fazer parte de Advertising Data com outros campos. Não é um pacote HCI completo.

## 2. Protocolo do controlador de carro — recuperado parcialmente

Escopo: classe `ContainerRemoveCarOperUIController`. O app também contém controladores distintos para tanques, empilhadeiras, câmeras e outros veículos. Não presumir que todos usem exatamente este layout.

| Offset no payload | Tamanho | Conteúdo observado |
|---|---:|---|
| 0 | 1 | Tipo `04` neste controlador |
| 1 | 1 | Operação: `06` para iniciar pareamento; `07` para controle |
| 2–4 | 3 | Identificador do carrinho, obtido da resposta de pareamento (`tankeaddr`) |
| 5–7 | 3 | Identificador do controlador (`machine_a`, `machine_b`, `machine_c`) |
| 8–17 | 10 | Bloco de controle `_sendData` |
| 18 | 1 | Checksum |

`CreateDuimaData()` aloca 19 bytes zerados, escreve `04 06` nos dois primeiros e o identificador do controlador nos offsets 5–7. `CreateCarbroadData()` escreve `04 07`, os dois identificadores e copia os dez bytes de controle.

Antes de anunciar, `HjdBluetoothHardwareInterface.StartAdvertising()` chama `cal_AndroidBle_sumdata()`. A função foi conferida no ARM64 com objdump:

```python
checksum = 0xE9
for b in payload[0:18]:
    checksum ^= b
payload[18] = checksum
```

Não se trata de CRC nem de soma aritmética. A evidência está em `analysis/evidence/HjdBluetoothHardwareInterface-cal_AndroidBle_sumdata.asm`, endereço virtual `0xE1905C`.

A resposta de pareamento é verificada como tipo `04`, operação `0A`, com o identificador do controlador nos offsets 9–11 do Advertising Data bruto. O identificador do carrinho é copiado dos offsets 6–8 do mesmo registro. Os offsets incluem os quatro bytes `16 FF 00 00`; não devem ser confundidos com os offsets de payload da tabela.

Constantes recuperadas: `SEND_DUIMA_CODE=6`, `SEND_NOW_CODE=7`, `REVICE_DUIMA_CODE=10`, `REVICE_NOW_CODE=9`. A existência da constante 9 não demonstra, sozinha, todos os caminhos de tratamento da resposta de controle.

Há contador `_miscodeIndex`, limite `250`, e temporizadores de atualização. No caminho GATT de `ProcessBleConnection()`, os cinco primeiros bytes recebem o resultado de `BuildControlData()` e o offset 6 recebe esse contador. A classe declara esperas de 20 ms e 50 ms, além de tempos de 1,5 s e 0,5 s usados no fluxo de anúncios. Isso não prova que o rádio emita um pacote a cada 20 ms: é necessário medir a temporização efetiva.

**Ainda não foi concluído:** validação física individual de cada sentido, direção esquerda/direita, escala de velocidade e sequência completa de reconexão. Os campos de frente/ré foram recuperados e o acionamento/parada dos motores foi confirmado pelo usuário na sequência acima. O nome “cipher” de um campo também não basta para concluir que há criptografia.

## 3. Transporte BLE GATT — confirmado no código

A classe `StartingExample` inicializa os seguintes valores:

| Campo | Valor |
|---|---|
| `DeviceName` | `RCCar` |
| `ServiceUUID` | `0000fff0-0000-1000-8000-00805f9b34fb` |
| `ControlUUID` | `0000fff2-0000-1000-8000-00805f9b34fb` |
| `ButtonUUID` | `0000fff1-0000-1000-8000-00805f9b34fb` |
| `cipherUUID` | `0000fff4-0000-1000-8000-00805f9b34fb` |

A atribuição foi conferida cruzando `.cctor`, offsets dos campos, relocações ELF e índices dos literais Unity. Não são apenas UUIDs encontrados por busca de texto.

`StartingExample.SendByte()` escreve em `ControlUUID` com resposta; `StartingExample.sendData()` escreve na mesma característica sem resposta. A ponte Java usa `connectGatt(..., transport=2)` e `BluetoothGatt.writeCharacteristic()`. O papel efetivo de FFF1 e a negociação de FFF4 ainda precisam ser acompanhados no fluxo completo/captura. Não basta escrever bytes aleatórios em FFF2.

## 4. Aplicação no ESP32

Para o caminho GATT, o ESP32 atua como central/cliente BLE: varre, conecta ao carrinho, descobre FFF0, executa a inicialização exigida e escreve em FFF2.

Para o caminho de anúncios, o ESP32 alterna ou coordena varredura e anúncios não conectáveis: envia a solicitação de pareamento, recebe a resposta, guarda o identificador do carrinho e transmite os blocos de controle com checksum.

O ESP-IDF oferece configuração de Advertising Data bruto (`esp_ble_gap_config_adv_data_raw`) e APIs GATT. Isso dá suporte ao transporte necessário, mas o firmware ainda precisa reproduzir o protocolo da aplicação. ESP32 original, ESP32-C3 e ESP32-S3 têm opções BLE; é preciso saber a placa exata antes de preparar o projeto. ESP32-S2 não serve para esse caminho sem rádio Bluetooth externo.

Não há necessidade demonstrada de um módulo de rádio proprietário externo para substituir o app. Isso não determina o rádio utilizado pelo controle físico “trasped”.

## 5. Captura necessária para validar o modelo

No telefone Android com o aplicativo que já controla o carrinho:

1. Ativar opções do desenvolvedor e **Registro de rastreamento Bluetooth HCI** (o nome varia; usar captura completa se houver escolha).
2. Desligar e ligar o Bluetooth para aplicar a configuração.
3. Com as rodas suspensas, iniciar o app e parear com um único carrinho.
4. Registrar uma sequência com pausas: neutro, frente fraca, neutro, frente forte, neutro, ré, neutro, esquerda, neutro, direita, neutro, luzes.
5. Gerar relatório de bug pelo Android ou por `adb bugreport rccar-bugreport.zip`.
6. Procurar `btsnoop_hci.log` no relatório. A disponibilidade e o conteúdo variam conforme o fabricante do telefone. O AOSP também documenta extração por `btsnooz.py`, mas o buffer reduzido não garante os payloads completos.

O log HCI pode mostrar escritas ATT/GATT ou comandos HCI que configuram os anúncios do próprio telefone. Para anúncios, um scanner BLE externo também pode capturar o Advertising Data enquanto o app é usado. Um scanner comum de anúncios não captura escritas de uma conexão GATT já estabelecida.

O modo por anúncios já foi confirmado no teste real. A captura do app permite completar a inicialização, medir repetição/contador e associar cada alteração do joystick aos bytes. Enviar preferencialmente o arquivo Bluetooth extraído; o relatório de bug completo contém dados adicionais do telefone.

## 6. Decodificador local

`tools/decode_adv.py` recebe um payload hexadecimal de 19 bytes ou Advertising Data completo com `--ad`. Ele extrai identificadores e verifica o checksum; não transmite comandos e ainda não interpreta aceleração/direção.

Exemplo **sintético**, sem validação no carrinho: solicitação de pareamento com identificador `01 02 03`:

```sh
python3 tools/decode_adv.py --ad '16 ff 00 00 04 06 00 00 00 01 02 03 00 00 00 00 00 00 00 00 00 00 eb'
```

## Evidências e cuidado com as ferramentas

- `analysis/jadx/sources/com/sthjd/mylibrary/HjdUnityBluetoothLE.java`: transporte por anúncios e filtro de recepção.
- `analysis/jadx/sources/com/shatalmic/unityandroidbluetoothlelib/UnityBluetoothLE.java`: transporte GATT.
- `analysis/cpp2il/DiffableCs/`: declarações e constantes recuperadas; corpos vazios **não** são código-fonte funcional.
- `analysis/control-methods-isil.txt`: representação intermediária dos métodos selecionados, com instruções não recuperadas.
- `analysis/evidence/*.asm`: desmontagem GNU objdump conferida usando endereços virtuais do ELF.

A seção “Disassembly” emitida pelo Cpp2IL apresentou inconsistência de mapeamento entre offsets de arquivo e endereços virtuais neste ELF. Ela não foi usada como confirmação final. A representação ISIL também deixa comparações sem implementação. O checksum e a criação do pacote foram conferidos na desmontagem independente; o restante deve ser tratado conforme os limites descritos acima.

## Referências externas

- [App informado na Google Play](https://play.google.com/store/apps/details?id=com.DeliMiniChe.carapp).
- [Android: coleta de logs Bluetooth HCI](https://source.android.com/docs/core/connect/bluetooth/verifying_debugging).
- [Android: AdvertiseData.Builder](https://developer.android.com/reference/android/bluetooth/le/AdvertiseData.Builder).
- [Espressif: GAP BLE e configuração de anúncios](https://docs.espressif.com/projects/esp-idf/en/stable/esp32/api-reference/bluetooth/esp_gap_ble.html).
- [Espressif: exemplo de cliente central NimBLE](https://github.com/espressif/esp-idf/tree/master/examples/bluetooth/nimble/blecent).

As conclusões específicas do protocolo acima vêm do pacote baixado, e não da descrição comercial da loja.
