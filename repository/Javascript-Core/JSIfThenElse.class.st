"
I execute different code snippets depending if the receiver is true (defined) or false (null).
"
Class {
	#name : #JSIfThenElse,
	#superclass : #JSDecoration,
	#instVars : [
		'trueStatement',
		'falseStatement'
	],
	#category : 'Javascript-Core-Decorations'
}

{ #category : #accessing }
JSIfThenElse >> falseStatement [
	^ falseStatement
]

{ #category : #accessing }
JSIfThenElse >> falseStatement: anObject [
	falseStatement := anObject
]

{ #category : #printing }
JSIfThenElse >> javascriptContentOn: aStream [
	aStream nextPut: $(.
	super javascriptContentOn: aStream.
	aStream nextPut: $?.
	aStream javascript: self trueStatement.
	aStream nextPut: $:.
	aStream javascript: self falseStatement.
	aStream nextPut: $)
]

{ #category : #accessing }
JSIfThenElse >> trueStatement [
	^ trueStatement
]

{ #category : #accessing }
JSIfThenElse >> trueStatement: anObject [
	trueStatement := anObject
]
