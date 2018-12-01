"
I join the decorated object with a binary operator.
"
Class {
	#name : #JSBinary,
	#superclass : #JSStatement,
	#instVars : [
		'operator'
	],
	#category : 'Javascript-Core-Decorations'
}

{ #category : #printing }
JSBinary >> javascriptContentOn: aStream [
	super javascriptContentOn: aStream.
	aStream
		nextPutAll: self operator;
		javascript: self statement
]

{ #category : #accessing }
JSBinary >> operator [
	^ operator
]

{ #category : #accessing }
JSBinary >> operator: aString [
	operator := aString
]
