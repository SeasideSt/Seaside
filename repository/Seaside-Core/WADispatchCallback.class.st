Class {
	#name : #WADispatchCallback,
	#superclass : #WACallback,
	#instVars : [
		'callbacks'
	],
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #evaluation }
WADispatchCallback >> evaluateWithArgument: anObject [
	callbacks at: anObject ifPresent: [ :callback | callback evaluateWithFieldValues: #(nil) ]
]

{ #category : #initialization }
WADispatchCallback >> setKey: aString callbacks: aDictionary [
	super setKey: aString callbacks: aDictionary.
	callbacks := aDictionary
]
