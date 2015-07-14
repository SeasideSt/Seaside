private
runServerErrorTestUsing: exceptionHandlerClass expectedResponseStatus: expectedResponseStatus
  | gemServer port response testUrl simpleUrl |
  self hasHttpClient
    ifFalse: [ 
      "no client? ... skip it"
      ^ self ].
  gemServer := self gemServer.
  port := gemServer ports first.
  testUrl := 'http://localhost:' , port printString , '/tests/gemServerError'.
  simpleUrl := 'http://localhost:' , port printString , '/tests/gemServerSimple'.
  [ 
  WAGemServerSimpleTestErrorPage initializeWithErrorHandler: exceptionHandlerClass.
  self restartGems: gemServer.
  response := self httpGet: testUrl.
  self assert: response status = expectedResponseStatus.
  response := self httpGet: simpleUrl.
  self assert: response status = 200	"server should not crash" ]
    ensure: [ self stopGems: gemServer ]