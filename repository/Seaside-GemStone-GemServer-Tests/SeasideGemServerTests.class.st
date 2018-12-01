Class {
	#name : #SeasideGemServerTests,
	#superclass : #TestCase,
	#instVars : [
		'registry'
	],
	#classVars : [
		'InteractiveRemoteServer',
		'StaticRemoteServer'
	],
	#category : 'Seaside-GemStone-GemServer-Tests'
}

{ #category : #accessing }
SeasideGemServerTests class >> interactiveRemoteServer [
  InteractiveRemoteServer ifNil: [ InteractiveRemoteServer := false ].
  ^ InteractiveRemoteServer
]

{ #category : #accessing }
SeasideGemServerTests class >> interactiveRemoteServer: aBool [
  "self interactiveRemoteServer: true"

  InteractiveRemoteServer := aBool
]

{ #category : #Testing }
SeasideGemServerTests class >> isAbstract [
  "Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

  ^ self sunitName = #'SeasideGemServerTests'
]

{ #category : #accessing }
SeasideGemServerTests class >> staticRemoteServer [
  StaticRemoteServer ifNil: [ StaticRemoteServer := false ].
  ^ StaticRemoteServer
]

{ #category : #accessing }
SeasideGemServerTests class >> staticRemoteServer: aBool [
  "self staticRemoteServer: true"

  StaticRemoteServer := aBool
]

{ #category : #accessing }
SeasideGemServerTests >> gemServer [
  self subclassResponsibility
]

{ #category : #accessing }
SeasideGemServerTests >> gemServerName [
  self subclassResponsibility
]

{ #category : #testing }
SeasideGemServerTests >> hasHttpClient [
  ^ self httpClientClass notNil
]

{ #category : #accessing }
SeasideGemServerTests >> httpClient [
  "we'll use ZnEasy if it's available"

  ^ Smalltalk at: #'ZnEasy' ifAbsent: [  ]
]

{ #category : #accessing }
SeasideGemServerTests >> httpClientClass [
  ^ Smalltalk at: #'ZnClient' ifAbsent: [  ]
]

{ #category : #'http client support' }
SeasideGemServerTests >> httpGet: urlObject [
  | client |
  client := self httpClientClass new
    beOneShot;
    yourself.
  client
    numberOfRetries: 4;
    retryDelay: 2.	"be generous with retries for tests run on loaded systems"
  ^ client
    url: urlObject;
    get;
    response
]

{ #category : #'http client support' }
SeasideGemServerTests >> httpGetNoRetry: urlObject [
  | client |
  client := self httpClientClass new
    beOneShot;
    yourself.
  ^ client
    url: urlObject;
    get;
    response
]

{ #category : #private }
SeasideGemServerTests >> interactiveRemoteServer [
  ^ self class interactiveRemoteServer
]

{ #category : #private }
SeasideGemServerTests >> restartGems: gemServer [
  self staticRemoteServer
    ifTrue: [ 
      System commitTransaction.
      self
        notify:
          'evaluate on server: abort; /home/seaside3/gemServer interactiveStart='
            , self gemServerName ]
    ifFalse: [ 
      gemServer restartGems.
      self
        waitForGemServer: gemServer
        message: 'Gems did not restart ' , self gemServerName ]
]

{ #category : #private }
SeasideGemServerTests >> runServerErrorTestUsing: exceptionHandlerClass [
  self
    runServerErrorTestUsing: exceptionHandlerClass
    expectedResponseStatus: 500
]

{ #category : #private }
SeasideGemServerTests >> runServerErrorTestUsing: exceptionHandlerClass expectedResponseStatus: expectedResponseStatus [
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
]

{ #category : #running }
SeasideGemServerTests >> setUp [
  super setUp.
  registry := GemServerRegistry singleton.
  GemServerRegistry _singleton: nil
]

{ #category : #private }
SeasideGemServerTests >> startGems: gemServer [
  self staticRemoteServer
    ifTrue: [ 
      System commitTransaction.
      self
        notify:
          'evaluate on server: abort; /home/seaside3/gemServer interactiveStart='
            , self gemServerName ]
    ifFalse: [ 
      gemServer startGems.
      self
        waitForGemServer: gemServer
        message: 'Gems did not start ' , self gemServerName ]
]

{ #category : #private }
SeasideGemServerTests >> staticRemoteServer [
  ^ self class staticRemoteServer
]

{ #category : #private }
SeasideGemServerTests >> stopGems: gemServer [
  self staticRemoteServer
    ifFalse: [ gemServer stopGems ]
]

{ #category : #running }
SeasideGemServerTests >> tearDown [
  super tearDown.
  GemServerRegistry _singleton: registry.
  System commitTransaction
]

{ #category : #tests }
SeasideGemServerTests >> testSimpleGet [
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
]

{ #category : #tests }
SeasideGemServerTests >> testStartRestartStopServer [
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
]

{ #category : #tests }
SeasideGemServerTests >> testWAGemStoneProductionErrorHandler [
  [ self runServerErrorTestUsing: WAGemStoneProductionErrorHandler ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testWAGemStoneProductionErrorHandler error: ' , ex description;
        show: (GsProcess stackReportToLevel: 100).
      ex pass ]
]

{ #category : #tests }
SeasideGemServerTests >> testWAGemStoneWalkbackErrorHandler [
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
]

{ #category : #tests }
SeasideGemServerTests >> testWARemoteDebuggingWalkbackErrorHandler [
  [ self runServerErrorTestUsing: WARemoteDebuggingWalkbackErrorHandler ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show:
            'testWARemoteDebuggingWalkbackErrorHandler error: ' , ex description;
        show: (GsProcess stackReportToLevel: 100).
      ex pass ]
]

{ #category : #private }
SeasideGemServerTests >> validatePidFile: gemServer shouldExist: shouldExist [
  | portCount |
  portCount := 0.
  gemServer ports
    do: [ :port | 
      | fileName |
      portCount := portCount + 1.
      fileName := gemServer gemPidFileName: port.
      ServerFileDirectory
        splitName: fileName
        to: [ :dirPath :fileName | 
          | dir x |
          dir := ServerFileDirectory on: dirPath.
          self assert: (x := dir fileExists: fileName) == shouldExist ] ].
  ^ portCount
]

{ #category : #private }
SeasideGemServerTests >> waitForGemServer: gemServer message: message [
  (gemServer waitForStartGems: 20)
    ifFalse: [ 
      Transcript
        cr;
        show: message.
      self assert: false ].
  (Delay forSeconds: 3) wait
]
