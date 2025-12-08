"
I am a special case of JSArguments with only a singular argument. I am a performance optimization to avoid an array allocation.
"
Class {
	#name : 'JSArgument',
	#superclass : 'WAObject',
	#instVars : [
		'argument'
	],
	#category : 'Javascript-Core-Base',
	#package : 'Javascript-Core',
	#tag : 'Base'
}

{ #category : 'instance creation' }
JSArgument class >> with: anObject [
	^ self basicNew
		initializeWith: anObject
]

{ #category : 'initialization' }
JSArgument >> initializeWith: anObject [
	self initialize.
	argument := anObject
]

{ #category : 'printing' }
JSArgument >> javascriptOn: aRenderer [
	aRenderer arguments: [ 
		aRenderer argument: argument ]
]
