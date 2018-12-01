"
I am a streaming server that directly writes the resulting data onto the socket. I use the request parsing of Comanche, otherwise I am a web server on my own.

Note that the WAListenerAdaptor is not supposed to support redirects during the rendering phase, like it is done in WAAuthenticationFilter. It might work in the case the buffers of the socket stream haven't been flushed yet, but in most cases it doesn't. This is not a bug and will never be changed.
"
Class {
	#name : #WAListenerAdaptor,
	#superclass : #WAComancheRequestConverter,
	#instVars : [
		'process'
	],
	#category : 'Seaside-Adaptors-Comanche'
}

{ #category : #private }
WAListenerAdaptor >> basicStart [
	process := [ [ self listenLoop ] repeat ] newProcess.
	process priority: Processor userBackgroundPriority.
	process name: 'seaside-' , self port printString.
	process resume
]

{ #category : #private }
WAListenerAdaptor >> basicStop [
	process isNil
		ifFalse: [ process terminate ].
	process := nil
]

{ #category : #testing }
WAListenerAdaptor >> isRunning [
	^ process notNil and: [ process isTerminated not ]
]

{ #category : #testing }
WAListenerAdaptor >> isStarting [
	^ process notNil and: [ process isSuspended ]
]

{ #category : #testing }
WAListenerAdaptor >> isStopped [
	^ process isNil
]

{ #category : #testing }
WAListenerAdaptor >> isStopping [
	^ process notNil and: [ process isTerminated ]
]

{ #category : #private }
WAListenerAdaptor >> listenLoop [
	| socket |
	socket := Socket newTCP.
	socket 
		listenOn: port
		backlogSize: 50.
	socket isValid ifFalse: [ self error: 'Cannot listen on port ' , port greaseString ].
	
	[ 
	[ socket isValid ifFalse: [ ^ self listenLoop ].
	self waitForConnection: socket ] repeat ] ifCurtailed: 
		[ (Delay forMilliseconds: 10) wait.
		socket destroy ]
]

{ #category : #converting }
WAListenerAdaptor >> requestFor: aSocketStream [
	^ super requestFor: (HttpRequest readFromStream: aSocketStream)
]

{ #category : #converting }
WAListenerAdaptor >> responseFor: aSocketStream [
	^ WAStreamedResponse
		on: (GRSwitchableStream
			onCodecStream: (self codec encoderFor: aSocketStream)
			socketStream: aSocketStream)
]

{ #category : #converting }
WAListenerAdaptor >> responseFrom: aRequestContext [
	aRequestContext response flush
]

{ #category : #private }
WAListenerAdaptor >> shutDown [
	process isNil
		ifFalse: [ process terminate ]
]

{ #category : #private }
WAListenerAdaptor >> startUp [
	process isNil
		ifFalse: [ self restart ]
]

{ #category : #private }
WAListenerAdaptor >> waitForConnection: aSocket [
	| socket stream |
	socket := aSocket waitForAcceptFor: 10.
	socket isNil ifTrue: [ ^ self ].
	stream := SocketStream on: socket.
	[ [ [ self process: stream ]
		ensure: [ stream close ] ]
			ifCurtailed: [ socket destroy ] ]
				forkAt: Processor userBackgroundPriority
]
