Class {
	#name : #JSConditionElse,
	#superclass : #JSCondition,
	#instVars : [
		'elseStatement'
	],
	#category : 'Javascript-Core-Decorations'
}

{ #category : #'instance creation' }
JSConditionElse class >> on: statement else: elseStatement [

	^ (super on: statement)
		elseStatement: elseStatement;
		yourself
]

{ #category : #accessing }
JSConditionElse >> elseStatement [
	^ elseStatement
]

{ #category : #accessing }
JSConditionElse >> elseStatement: anObject [
	elseStatement := anObject
]

{ #category : #accessing }
JSConditionElse >> javascriptContentOn: aStream [

	super javascriptContentOn: aStream.
	aStream 
		nextPutAll: 'else{';
		javascript: self elseStatement.
	aStream nextPut: $}
]
