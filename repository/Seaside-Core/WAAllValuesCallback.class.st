"
WAAllValuesCallback is a special WAValueCallback that whos value is a sequenceable collection of values.
"
Class {
	#name : 'WAAllValuesCallback',
	#superclass : 'WAValueCallback',
	#category : 'Seaside-Core-Callbacks',
	#package : 'Seaside-Core',
	#tag : 'Callbacks'
}

{ #category : 'evaluation' }
WAAllValuesCallback >> evaluateWithFieldValues: anOrderedCollection [
	self evaluateWithArgument: (anOrderedCollection collect: [ :each |
		self valueForField: each ])
]
