"
WAAllValuesCallback is a special WAValueCallback that whos value is a sequenceable collection of values.
"
Class {
	#name : #WAAllValuesCallback,
	#superclass : #WAValueCallback,
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #evaluation }
WAAllValuesCallback >> evaluateWithFieldValues: anOrderedCollection [
	self evaluateWithArgument: (anOrderedCollection collect: [ :each |
		self valueForField: each ])
]
