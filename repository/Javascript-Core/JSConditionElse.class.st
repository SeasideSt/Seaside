Class {
	#name : 'JSConditionElse',
	#superclass : 'JSCondition',
	#instVars : [
		'elseStatement'
	],
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'instance creation' }
JSConditionElse class >> on: statement else: elseStatement [

	^ (super on: statement)
		elseStatement: elseStatement;
		yourself
]

{ #category : 'accessing' }
JSConditionElse >> elseStatement [
	^ elseStatement
]

{ #category : 'accessing' }
JSConditionElse >> elseStatement: anObject [
	elseStatement := anObject
]

{ #category : 'printing' }
JSConditionElse >> javascriptContentOn: aRenderer [

	super javascriptContentOn: aRenderer.
	aRenderer document 
		nextPutAll: 'else';
		openBlock.
	aRenderer render: self elseStatement.
	aRenderer document closeBlock
]
