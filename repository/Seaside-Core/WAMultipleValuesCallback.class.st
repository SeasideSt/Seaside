Class {
	#name : #WAMultipleValuesCallback,
	#superclass : #WAValuesCallback,
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #evaluation }
WAMultipleValuesCallback >> evaluateWithFieldValues: anOrderedCollection [
	| selectedValues keys |
	selectedValues := OrderedCollection new.
	keys := anOrderedCollection collect: [ :each | each isNil ifFalse: [ each greaseInteger ] ].
	keys do: [ :each | values at: each ifPresent: [ :value | selectedValues add: value ] ].
	block valueWithPossibleArguments: (Array with: selectedValues) 
]
