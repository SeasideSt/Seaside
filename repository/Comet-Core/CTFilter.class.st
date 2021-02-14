Class {
	#name : #CTFilter,
	#superclass : #WARequestFilter,
	#instVars : [
		'handlers'
	],
	#category : 'Comet-Core'
}

{ #category : #processing }
CTFilter >> cometForContext: aRequestContext [
	^ (handlers
		at: (aRequestContext request fields
			at: CTComet headerField
			ifAbsent: [ ^ nil ])
		ifAbsent: [ ^ nil ])
			connect: aRequestContext
]

{ #category : #processing }
CTFilter >> handleFiltered: aRequestContext [
	(aRequestContext response isStreamingResponse)
		ifFalse: [ CTStreamingServerRequired signal: 'Streaming server required.' ].
	(aRequestContext request includesKey: CTComet headerField)
		ifTrue: [ self cometForContext: aRequestContext ]
		ifFalse: [ super handleFiltered: aRequestContext ]
]

{ #category : #initialization }
CTFilter >> initialize [
	super initialize.
	handlers := Dictionary new
]

{ #category : #testing }
CTFilter >> isCometFilter [
	^ true
]

{ #category : #public }
CTFilter >> registerPusher: aPusher context: aContext [
	| handler |
	handler := CTHandler on: aPusher.
	handlers at: handler id put: handler.
	^ handler id
]
