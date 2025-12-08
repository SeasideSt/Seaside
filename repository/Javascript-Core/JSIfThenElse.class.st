"
I execute different code snippets depending if the receiver is true (defined) or false (null).
"
Class {
	#name : 'JSIfThenElse',
	#superclass : 'JSDecoration',
	#instVars : [
		'trueStatement',
		'falseStatement'
	],
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'accessing' }
JSIfThenElse >> falseStatement [
	^ falseStatement
]

{ #category : 'accessing' }
JSIfThenElse >> falseStatement: anObject [
	falseStatement := anObject
]

{ #category : 'printing' }
JSIfThenElse >> javascriptContentOn: aRenderer [
	aRenderer document nextPut: $(.
	super javascriptContentOn: aRenderer.
	aRenderer document nextPut: $?.
	aRenderer render: self trueStatement.
	aRenderer document nextPut: $:.
	aRenderer render: self falseStatement.
	aRenderer document nextPut: $)
]

{ #category : 'accessing' }
JSIfThenElse >> trueStatement [
	^ trueStatement
]

{ #category : 'accessing' }
JSIfThenElse >> trueStatement: anObject [
	trueStatement := anObject
]
