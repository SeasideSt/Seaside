Class {
	#name : #WAGsSwazooAdaptor,
	#superclass : #WASwazooAdaptor,
	#category : 'Seaside-GemStone-Adaptors-Swazoo'
}

{ #category : #converting }
WAGsSwazooAdaptor >> contextFor: aNativeRequest [
	"Answer a request context for aNativeRequest."

	^ WAGemStoneRequestContext
		request: (self requestFor: aNativeRequest)
		response: (self responseFor: aNativeRequest)
		codec: self codec
]

{ #category : #defaults }
WAGsSwazooAdaptor >> defaultCodec [

	^GRUtf8GemStoneCodec new
]

{ #category : #adapting }
WAGsSwazooAdaptor >> internalServerErrorMessage: message [

	| response |
	response := (HTTPResponse new)
		code: 500;
		entity:
			'<html><head><title>Internal server malfunction</title></head>',
			'<body><h1>Internal server malfunction</h1><h2 style="color: blue">'
			, message ,
			'</h2><div style="font-family: sans-serif">You should contact the system administrator</div></body></html>';
		yourself.
	GRPlatform current logError: message title: 'Internal Swazoo'.
	^response
]

{ #category : #processing }
WAGsSwazooAdaptor >> process: aNativeRequest [
	
	^GRPlatform current 
		seasideProcessRequest: aNativeRequest 
		adaptor: self
		resultBlock: [:aRequest | super process: aRequest ]
]

{ #category : #'starting/stopping' }
WAGsSwazooAdaptor >> start [
  "blocks main thread, does not return"

  self gemServerStart.
  [ true ] whileTrue: [ (Delay forSeconds: 10) wait ]
]

{ #category : #private }
WAGsSwazooAdaptor >> startUp [
	SwazooServer restart
]
