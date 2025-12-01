Class {
	#name : 'WAUploadCallback',
	#superclass : 'WAValueCallback',
	#category : 'Seaside-Core-Callbacks',
	#package : 'Seaside-Core',
	#tag : 'Callbacks'
}

{ #category : 'converting' }
WAUploadCallback >> valueForField: anObject [
	^ (anObject isKindOf: WAAbstractFile) ifTrue: [ anObject ]
]
