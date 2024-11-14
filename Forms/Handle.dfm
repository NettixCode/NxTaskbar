object HandleForm: THandleForm
  Left = 0
  Top = 0
  Caption = 'HandleForm'
  ClientHeight = 120
  ClientWidth = 202
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SchXML: TMemo
    Left = 8
    Top = 8
    Width = 185
    Height = 49
    Lines.Strings = (
      '<?xml version="1.0" encoding="UTF-16"?>'
      
        '<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/' +
        '2004/02/mit/task">'
      '  <RegistrationInfo>'
      '    <Author>NxTaskbar</Author>'
      '    <Description>NxTaskbar Running Service</Description>'
      '    <URI>\NxTaskbar</URI>'
      '  </RegistrationInfo>'
      '  <Triggers>'
      '    <LogonTrigger>'
      '      <StartBoundary>2023-07-04T10:42:00</StartBoundary>'
      '      <Enabled>true</Enabled>'
      '    </LogonTrigger>'
      '  </Triggers>'
      '  <Principals>'
      '    <Principal id="Author">'
      '      <GroupId>S-1-5-32-545</GroupId>'
      '      <RunLevel>HighestAvailable</RunLevel>'
      '    </Principal>'
      '  </Principals>'
      '  <Settings>'
      '    <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>'
      
        '    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatterie' +
        's>'
      '    <StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>'
      '    <AllowHardTerminate>true</AllowHardTerminate>'
      '    <StartWhenAvailable>true</StartWhenAvailable>'
      '    <RunOnlyIfNetworkAvailable>false</RunOnlyIfNetworkAvailable>'
      '    <IdleSettings>'
      '      <Duration>PT10M</Duration>'
      '      <WaitTimeout>PT1H</WaitTimeout>'
      '      <StopOnIdleEnd>false</StopOnIdleEnd>'
      '      <RestartOnIdle>false</RestartOnIdle>'
      '    </IdleSettings>'
      '    <AllowStartOnDemand>true</AllowStartOnDemand>'
      '    <Enabled>true</Enabled>'
      '    <Hidden>false</Hidden>'
      '    <RunOnlyIfIdle>false</RunOnlyIfIdle>'
      '    <WakeToRun>false</WakeToRun>'
      '    <ExecutionTimeLimit>PT0S</ExecutionTimeLimit>'
      '    <Priority>7</Priority>'
      '  </Settings>'
      '  <Actions Context="Author">'
      '    <Exec>'
      '      <Command>EXEPATH</Command>'
      '    </Exec>'
      '  </Actions>'
      '</Task>')
    TabOrder = 0
    WordWrap = False
  end
  object schTMP: TMemo
    Left = 9
    Top = 63
    Width = 185
    Height = 50
    TabOrder = 1
    WordWrap = False
  end
  object TimerDeleteXML: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerDeleteXMLTimer
    Left = 168
    Top = 80
  end
end
