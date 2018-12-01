Class {
	#name : #WAValuesCallback,
	#superclass : #WAValueCallback,
	#instVars : [
		'values'
	],
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #'instance creation' }
WAValuesCallback class >> on: aBlock values: aDictionary [
	^ self new block: aBlock; values: aDictionary; yourself
]

{ #category : #evaluation }
WAValuesCallback >> evaluateWithArgument: anObject [
	values at: anObject greaseInteger ifPresent: [ :value | block valueWithPossibleArguments: (Array with: value) ]
]

{ #category : #accessing }
WAValuesCallback >> values [
	^ values
]

{ #category : #accessing }
WAValuesCallback >> values: aDictionary [ 
	values := aDictionary
]
