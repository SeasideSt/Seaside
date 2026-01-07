"
I apply a JavaScript function and provide arguments.
"
Class {
	#name : 'JSApply',
	#superclass : 'JSDecoration',
	#instVars : [
		'arguments'
	],
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'accessing' }
JSApply >> arguments [
	^ arguments
]

{ #category : 'accessing' }
JSApply >> arguments: aCollection [
	arguments := aCollection
]

{ #category : 'accessing' }
JSApply >> argumentsDo: aBlock [
	self arguments do: aBlock
]

{ #category : 'printing' }
JSApply >> javascriptContentOn: aRenderer [
	super javascriptContentOn: aRenderer.
	aRenderer arguments: [ 
		self argumentsDo: [ :each |
			aRenderer argument: each ] ]
]
