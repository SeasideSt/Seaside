Class {
	#name : 'WAAllUrlsCallback',
	#superclass : 'WAAllValuesCallback',
	#category : 'Seaside-Core-Callbacks',
	#package : 'Seaside-Core',
	#tag : 'Callbacks'
}

{ #category : 'converting' }
WAAllUrlsCallback >> valueForField: anObject [
	^ anObject isEmptyOrNil
		ifTrue: [ nil ]
		ifFalse: [ WAUrl absolute: anObject ]
]
