object notas_versao: Tnotas_versao
  Left = 656
  Top = 290
  Width = 643
  Height = 414
  Caption = 'Notas de Vers'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 627
    Height = 376
    Align = alClient
    Lines.Strings = (
      'v1.4.10'
      
        '- Implementa'#231#227'o entrada do alarme de inc'#234'ndio (configur'#225'vel pelo' +
        ' comando 33);'
      
        '- Implementa'#231#227'o da sa'#237'da B4 para sa'#237'da de acinonamento do bra'#231'o ' +
        'que cai de catracas;'
      
        '- Implementa'#231#227'o de comando: "0x33: Define entrada digital de inc' +
        #234'ndio";'
      ''
      'v1.4.9'
      
        '- Implementa'#231#227'o do modo seguro para catraca (bloqueio das leitor' +
        'as durante acesso);'
      '- Otimiza'#231#227'o do controle de fluxo de catraca;'
      
        '- Implementa'#231#227'o da valida'#231#227'o de acesso pelo sensor do cofre de c' +
        'atracas;'
      
        '- Novo comando 0x41 : Configura'#231#227'o da valida'#231#227'o de acesso pelo s' +
        'ensor do cofre;'
      ''
      'v1.4.8'
      '- Implementa'#231#227'o do controle de fluxo de catraca;'
      '- Implementa'#231#227'o da catraca PNE (deficiente);'
      '- Transmite evento com mem'#243'ria vazia;'
      ''
      'v1.4.7'
      '- Implementa'#231#227'o da catraca Task com picto de LED;'
      ''
      'v1.4.6'
      '- Implementa'#231#227'o da leitora de c'#243'digo de barras serial RS232;'
      
        '- Implementa'#231#227'o do scanner de c'#243'digo de barras "keyboard PC (PS/' +
        '2)";'
      
        '- Retorno 0x89: Transmiss'#227'o do c'#243'digo de barras (sem restri'#231#227'o d' +
        'e tamanho e somente online);'
      ''
      'v1.4.5'
      '- Implementa'#231#227'o da leitora Wiegand 35b (0Dh);'
      '- Implementa'#231#227'o da leitora H'#237'brida 26b/35b (0Eh);'
      ''
      'v1.4.4'
      '- Implementa'#231#227'o do HANDKEY na L3 (RS232);'
      
        '- Novos comandos: SETUP_LEITORAS_RS232(3Bh), HK_ENROLL(3Ch), HK_' +
        'VERIFY(3Dh), HK_RTC(3Eh), HK_MSG(3Fh) '
      'HK_BEEP(40h);'
      '- Novas respostas: HK_ID(8Ah), HK_TEMPLATE(8Bh), HK_ERRO(90h);'
      
        '- Redu'#231#227'o da resolu'#231#227'o do tempo de acionamento de trava magnetic' +
        'a / Fechadura mecanica'
      ''
      'v1.4.3'
      
        '- Implementa'#231#227'o de biblioteca exclusiva para tratamento de cofre' +
        ' coletor;'
      '- Implementa'#231#227'o da porta com cofre coletor (sem sensor);'
      '- Corre'#231#227'o no tratamento da L3 emulando a L1;'
      ''
      'v1.4.2:'
      '- Implementa'#231#227'o do sensor de cofre coletor (Catracas TASK);'
      '- Corre'#231#227'o do erro na funcionalidade do sentido da catraca;'
      ''
      'v1.4.1:'
      '- Implementa'#231#227'o do comando 28h (Ignora FC / Inibe Buzzer);'
      ''
      'v1.4.0:'
      '- Registro autom'#225'tico do IP do host;'
      '- Inclus'#227'o da leitora "APK-20 Maxtel"  (com teclado 4 bits);'
      ''
      'v1.3.5:'
      
        '- Corre'#231#227'o do erro do cofre coletor para modos de opera'#231#227'o ONLIN' +
        'E e MISTO;'
      '- Amplia'#231#227'o da capacidade da "Queue" de leitoras;'
      ''
      'v1.3.4:'
      
        '- Otimiza'#231#227'o das fun'#231#245'es de inicializa'#231#227'o e tratamento de interr' +
        'up'#231#227'o das leitoras TTL;'
      '- Implementa'#231#227'o do modo de opera'#231#227'o ONLINE e MISTO;'
      
        '- Implementa'#231#227'o de comando: "0x38: Configura'#231#227'o do modo de opera' +
        #231#227'o";'
      '- Implementa'#231#227'o de comando: "0x39: Libera'#231#227'o de acesso ON-LINE";'
      
        '- Implementa'#231#227'o de comando: "0x3A: Configura Time Out do Modo Mi' +
        'sto"'
      
        '- Implementa'#231#227'o de comando: "0x86: Cart'#227'o Presente" (somente em ' +
        'modo on-line)'
      ''
      'v1.3.3:'
      '- Implementa'#231#227'o das leitoras BRT-1 (Indala) e BRT-2 (HID);'
      'Para configurar utilizando o comando 20h:'
      '   BRT-1 : 09h (c'#243'digo j'#225' existente na UTRM);'
      '   BRT-2: 0Bh (novo c'#243'digo);'
      ''
      'v1.3.2:'
      
        '- Altera'#231#227'o na l'#243'gica do time-out de eventos de libera'#231#227'o remota' +
        ' (p/ compatibilizar com a UTRM-net);'
      '- Corre'#231#227'o dos c'#243'digos de eventos da L2 em CATRACAS;'
      
        '- Corre'#231#227'o de bug na funcionalidade do LED da leitoras para uma ' +
        'porta sem sensor;'
      ''
      'v1.3.1:'
      '- Inclus'#227'o da leitora Indala Wiegand 44 bits (Apollo/Lenel);'
      
        '- Altera'#231#227'o na l'#243'gica dos tempos de fechadura e de acesso de por' +
        'ta sem/com sensor (p/ compatibilizar com a UTRM-net);'
      '- Implementa'#231#227'o do intertravamento em porta sem/com sensor;'
      
        '- Corre'#231#227'o da valida'#231#227'o de cart'#227'o MESTRE em porta sem/com sensor' +
        ';'
      '- Implementa'#231#227'o do LED da leitora (somente em PORTAS);')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
