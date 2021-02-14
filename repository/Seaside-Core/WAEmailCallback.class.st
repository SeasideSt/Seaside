"
A WAEmailCallback is a callback for email input fields.

"
Class {
	#name : #WAEmailCallback,
	#superclass : #WAValueCallback,
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #converting }
WAEmailCallback >> valueForField: anObject [
	^ anObject isEmptyOrNil
		ifTrue: [ nil ]
		ifFalse: [ WAEmailAddress address: anObject ]
]
