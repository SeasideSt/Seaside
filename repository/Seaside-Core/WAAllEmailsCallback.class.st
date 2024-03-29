Class {
	#name : 'WAAllEmailsCallback',
	#superclass : 'WAAllValuesCallback',
	#category : 'Seaside-Core-Callbacks',
	#package : 'Seaside-Core',
	#tag : 'Callbacks'
}

{ #category : 'converting' }
WAAllEmailsCallback >> valueForField: anObject [
	^ anObject isEmptyOrNil
		ifTrue: [ nil ]
		ifFalse: [ WAEmailAddress address: anObject ]
]
