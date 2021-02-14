Class {
	#name : #WAUploadCallback,
	#superclass : #WAValueCallback,
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #converting }
WAUploadCallback >> valueForField: anObject [
	^ (anObject isKindOf: WAFile) ifTrue: [ anObject ]
]
