Class {
	#name : #WAGemStoneRequestContext,
	#superclass : #WARequestContext,
	#instVars : [
		'forDebugging'
	],
	#category : 'Seaside-GemStone-Core-RequestHandling'
}

{ #category : #initialization }
WAGemStoneRequestContext >> destroy [
	"Clear references to objects when the receiver is no longer required. This helps avoid circular references and reduces memory consumption. This method is called by the ServerAdaptor after request processing is finished."
	
	self forDebugging ifFalse: [ super destroy ]
]

{ #category : #accessing }
WAGemStoneRequestContext >> forDebugging [

	forDebugging == nil ifTrue: [ forDebugging := false ].
	^forDebugging
]

{ #category : #updating }
WAGemStoneRequestContext >> forDebugging: aBoolean [

	forDebugging := aBoolean
]
