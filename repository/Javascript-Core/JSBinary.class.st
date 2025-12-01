"
I join the decorated object with a binary operator.
"
Class {
	#name : 'JSBinary',
	#superclass : 'JSStatement',
	#instVars : [
		'operator'
	],
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'printing' }
JSBinary >> javascriptContentOn: aRenderer [
	super javascriptContentOn: aRenderer.
	(aRenderer operator: self operator)
		with: self statement
]

{ #category : 'accessing' }
JSBinary >> operator [
	^ operator
]

{ #category : 'accessing' }
JSBinary >> operator: aString [
	operator := aString
]
