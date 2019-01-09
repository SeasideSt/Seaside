tests
testSimpleGet
  [ 
  | gemServer port url response |
  self hasHttpClient
    ifFalse: [ 
      "no client? ... skip it"
      ^ self ].
  gemServer := self gemServer.
  port := gemServer ports first.
  url := 'http://localhost:' , port printString , '/tests/gemServerSimple'.
  [ 
  self restartGems: gemServer.
  response := self httpGet: url.
  Transcript
    cr;
    show: 'testSimpleGet response status: ' , response status printString.
  self assert: response status = 200 ]
    ensure: [ self stopGems: gemServer ] ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testSimpleGet error: ' , ex description;
        show: (GsProcess stackReportToLevel: 100).
      ex pass ]