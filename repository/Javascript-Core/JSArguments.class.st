"
I am a collection of Javascript function arguments.
"
Class {
	#name : 'JSArguments',
	#superclass : 'WAObject',
	#instVars : [
		'arguments'
	],
	#category : 'Javascript-Core-Base',
	#package : 'Javascript-Core',
	#tag : 'Base'
}

{ #category : 'instance creation' }
JSArguments class >> withAll: aCollection [
	^ self basicNew
		initializeWithAll: aCollection
]

{ #category : 'initialization' }
JSArguments >> initializeWithAll: aCollection [
	self initialize.
	arguments := aCollection
]

{ #category : 'printing' }
JSArguments >> javascriptOn: aRenderer [
	aRenderer arguments: [
		arguments do: [ :each | 
			aRenderer argument: each ] ]
]
