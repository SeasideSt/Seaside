Class {
	#name : #WAAllEmailsCallback,
	#superclass : #WAAllValuesCallback,
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #converting }
WAAllEmailsCallback >> valueForField: anObject [
	^ anObject isEmptyOrNil
		ifTrue: [ nil ]
		ifFalse: [ WAEmailAddress address: anObject ]
]
