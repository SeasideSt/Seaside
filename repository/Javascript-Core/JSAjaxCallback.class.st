Class {
	#name : 'JSAjaxCallback',
	#superclass : 'WACallback',
	#instVars : [
		'block'
	],
	#category : 'Javascript-Core-Base',
	#package : 'Javascript-Core',
	#tag : 'Base'
}

{ #category : 'accessing' }
JSAjaxCallback >> block: aZeroOrOneArgBlock [
	block := aZeroOrOneArgBlock
]

{ #category : 'evaluation' }
JSAjaxCallback >> evaluateWithArgument: anObject [
	block isNil
		ifFalse: [ block valueWithPossibleArguments: (Array with: anObject) ].
	self requestContext
		respond: [ :response | response doNotCache ]
]

{ #category : 'accessing' }
JSAjaxCallback >> priority [
	^ 5
]
