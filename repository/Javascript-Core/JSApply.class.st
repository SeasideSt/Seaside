"
I apply a JavaScript function and provide arguments.
"
Class {
	#name : #JSApply,
	#superclass : #JSDecoration,
	#instVars : [
		'arguments'
	],
	#category : 'Javascript-Core-Decorations'
}

{ #category : #accessing }
JSApply >> arguments [
	^ arguments
]

{ #category : #accessing }
JSApply >> arguments: aCollection [
	arguments := aCollection
]

{ #category : #printing }
JSApply >> javascriptContentOn: aStream [
	super javascriptContentOn: aStream.
	JSStream encodeArguments: self arguments on: aStream
]
