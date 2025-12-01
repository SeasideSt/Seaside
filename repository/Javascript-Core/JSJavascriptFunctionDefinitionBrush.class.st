Class {
	#name : 'JSJavascriptFunctionDefinitionBrush',
	#superclass : 'JSJavascriptBrush',
	#instVars : [
		'arguments'
	],
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'public' }
JSJavascriptFunctionDefinitionBrush >> arguments: aCollectionOfStrings [
	arguments := aCollectionOfStrings
]

{ #category : 'private' }
JSJavascriptFunctionDefinitionBrush >> closeBrush [
	self document closeBlock
]

{ #category : 'private' }
JSJavascriptFunctionDefinitionBrush >> openBrush [
	self document nextPutAll: 'function('.
	arguments isNil ifFalse: [
		arguments do: [ :each | self document identifier: each ]
		separatedBy: [ self document nextPut: $, ].].
	self document nextPut: $).
	self document openBlock
]
