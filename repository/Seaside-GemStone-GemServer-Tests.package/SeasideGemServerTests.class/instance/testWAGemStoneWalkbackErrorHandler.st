tests
testWAGemStoneWalkbackErrorHandler
  "topaz session should crash..."

  | gemServer port response testUrl simpleUrl |
  self hasHttpClient
    ifFalse: [ 
      "no client? ... skip it"
      ^ self ].
  [ 
  gemServer := self gemServer yourself.
  port := gemServer ports first.
  testUrl := 'http://localhost:' , port printString , '/tests/gemServerError'.
  simpleUrl := 'http://localhost:' , port printString , '/tests/gemServerSimple'.
  [ 
  | exceptionSeen |
  WAGemServerSimpleTestErrorPage
    initializeWithErrorHandler: WAGemStoneWalkbackErrorHandler.
  self restartGems: gemServer.
  exceptionSeen := false.
  [ self httpGetNoRetry: testUrl ]
    on: ConnectionClosed
    do: [ :ex | 
      "remote server crashed ... good"
      exceptionSeen := true ].
  self assert: exceptionSeen ]
    ensure: [ self stopGems: gemServer ] ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testWAGemStoneWalkbackErrorHandler error: ' , ex description;
        show: (GsProcess stackReportToLevel: 100).
      ex pass ]