Class {
	#name : #WAAllUploadsCallback,
	#superclass : #WAUploadCallback,
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #evaluation }
WAAllUploadsCallback >> evaluateWithFieldValues: anOrderedCollection [
	self evaluateWithArgument: ((anOrderedCollection
		collect: [ :each | self valueForField: each ])
		reject: [ :each | each isNil ])
]
