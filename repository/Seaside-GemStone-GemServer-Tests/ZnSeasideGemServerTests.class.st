Class {
	#name : #ZnSeasideGemServerTests,
	#superclass : #SeasideGemServerTests,
	#category : 'Seaside-GemStone-GemServer-Tests'
}

{ #category : #accessing }
ZnSeasideGemServerTests >> gemServer [
  ^ ZnSeasideGemServer register: self gemServerName
]

{ #category : #accessing }
ZnSeasideGemServerTests >> gemServerName [
  ^ 'ZnSeasideServer'
]

{ #category : #private }
ZnSeasideGemServerTests >> setDebugMode: gemServer [
  gemServer debugMode: true
]

{ #category : #tests }
ZnSeasideGemServerTests >> testWAGemStoneWalkbackErrorHandler [
  self
    runServerErrorTestUsing: WAGemStoneWalkbackErrorHandler
    expectedResponseStatus: 200	"Break treated similarly to Breakpoint ... snap off continuation and resume"
]

{ #category : #tests }
ZnSeasideGemServerTests >> testWAGemStoneWalkbackErrorHandlerInteractive [
  "set debugMode on gemServer, since you would normally use WAGemStoneWalkbackErrorHandler
  interactively and you want the exception passed to your debugger ... when run remotely 
  the topaz session crashes"

  | gemServer port response testUrl simpleUrl |
  self hasHttpClient
    ifFalse: [ 
      "no client? ... skip it"
      ^ self ].
  gemServer := self gemServer.
  self setDebugMode: gemServer.
  port := gemServer ports first.
  testUrl := 'http://localhost:' , port printString , '/tests/gemServerError'.
  simpleUrl := 'http://localhost:' , port printString , '/tests/gemServerSimple'.
  [ 
  | exceptionSeen |
  WAGemServerSimpleTestErrorPage
    initializeWithErrorHandler: WAGemStoneWalkbackErrorHandler.
  gemServer restartGems.
  self
    waitForGemServer: gemServer
    message: 'Gems did not restart ' , self gemServerName.
  exceptionSeen := false.
  [ self httpGetNoRetry: testUrl ]
    on: ConnectionClosed
    do: [ :ex | 
      "remote server crashed ... good"
      exceptionSeen := true ].
  self assert: exceptionSeen ]
    ensure: [ gemServer stopGems ]
]
