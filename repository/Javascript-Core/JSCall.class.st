"
I represent a function call or method invocation to the decorated object.
"
Class {
	#name : 'JSCall',
	#superclass : 'JSDecoration',
	#instVars : [
		'name',
		'arguments'
	],
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'accessing' }
JSCall >> arguments [
	^ arguments
]

{ #category : 'accessing' }
JSCall >> arguments: anArray [ 
	arguments := anArray
]

{ #category : 'accessing' }
JSCall >> argumentsDo: aBlock [
	self arguments do: aBlock
]

{ #category : 'printing' }
JSCall >> javascriptContentOn: aRenderer [
	super javascriptContentOn: aRenderer.
	self name isEmptyOrNil ifFalse: [
		aRenderer document dotProperty: self name ].
	aRenderer arguments: [ 
		self argumentsDo: [ :each |
			aRenderer argument: each ] ]
]

{ #category : 'accessing' }
JSCall >> name [
	^ name
]

{ #category : 'accessing' }
JSCall >> name: aString [ 
	name := aString
]
