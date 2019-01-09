tests
testStartRestartStopServer
  "just start/restart/stop ... without an http client cannot do much else"

  self staticRemoteServer
    ifTrue: [ 
      "don't run test if running with a static remote server"
      ^ self ].
  [ 
  | gemServer |
  gemServer := self gemServer.
  [ 
  | statusReport portCount |
  gemServer startGems.
  self
    waitForGemServer: gemServer
    message: 'Gems did not start ' , self gemServerName.
  portCount := self validatePidFile: gemServer shouldExist: true.
  self assert: portCount = gemServer defaultPortOrResourceNameList size.
  gemServer restartGems.
  self
    waitForGemServer: gemServer
    message: 'Gems did not restart ' , self gemServerName.
  self validatePidFile: gemServer shouldExist: true.
  statusReport := gemServer statusGems.
  Transcript
    cr;
    show: statusReport.
  self assert: statusReport lines size = (gemServer ports size + 2)	"+ maintenance vm" ]
    ensure: [ 
      gemServer stopGems.
      self validatePidFile: gemServer shouldExist: false ] ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testStartRestartStopServer (Issue #59)';
        cr;
        show: ex description;
        cr;
        show: (GsProcess stackReportToLevel: 100).
      ex pass ]