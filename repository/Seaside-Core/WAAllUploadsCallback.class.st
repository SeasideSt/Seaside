Class {
	#name : 'WAAllUploadsCallback',
	#superclass : 'WAUploadCallback',
	#category : 'Seaside-Core-Callbacks',
	#package : 'Seaside-Core',
	#tag : 'Callbacks'
}

{ #category : 'evaluation' }
WAAllUploadsCallback >> evaluateWithFieldValues: anOrderedCollection [
	self evaluateWithArgument: ((anOrderedCollection
		collect: [ :each | self valueForField: each ])
		reject: [ :each | each isNil ])
]
