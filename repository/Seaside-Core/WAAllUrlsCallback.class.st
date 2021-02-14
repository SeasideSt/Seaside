Class {
	#name : #WAAllUrlsCallback,
	#superclass : #WAAllValuesCallback,
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #converting }
WAAllUrlsCallback >> valueForField: anObject [
	^ anObject isEmptyOrNil
		ifTrue: [ nil ]
		ifFalse: [ WAUrl absolute: anObject ]
]
