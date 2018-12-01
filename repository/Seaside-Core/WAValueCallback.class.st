Class {
	#name : #WAValueCallback,
	#superclass : #WACallback,
	#instVars : [
		'block'
	],
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #accessing }
WAValueCallback >> block: aOneArgBlock [
	block := aOneArgBlock fixCallbackTemps
]

{ #category : #evaluation }
WAValueCallback >> evaluateWithArgument: anObject [
	anObject isNil
		ifFalse: [ block valueWithPossibleArguments: (Array with: anObject) ]
]

{ #category : #converting }
WAValueCallback >> valueForField: anObject [
	"For most ValueCallbacks, it is more convenient to work with an empty String
	than with nil when the HTML input is empty."
	
	^ anObject ifNil: [ String new ]
]
