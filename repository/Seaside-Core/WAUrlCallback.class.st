"
A WAEmailCallback is a callback for url input fields.
"
Class {
	#name : 'WAUrlCallback',
	#superclass : 'WAValueCallback',
	#category : 'Seaside-Core-Callbacks',
	#package : 'Seaside-Core',
	#tag : 'Callbacks'
}

{ #category : 'converting' }
WAUrlCallback >> valueForField: anObject [
	^ anObject isEmptyOrNil
		ifTrue: [ nil ]
		ifFalse: [ WAUrl absolute: anObject ]
]
