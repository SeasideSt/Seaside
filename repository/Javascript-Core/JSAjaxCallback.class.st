Class {
	#name : #JSAjaxCallback,
	#superclass : #WACallback,
	#instVars : [
		'block'
	],
	#category : 'Javascript-Core'
}

{ #category : #accessing }
JSAjaxCallback >> block: aZeroOrOneArgBlock [
	block := aZeroOrOneArgBlock isNil
		ifFalse: [ aZeroOrOneArgBlock fixCallbackTemps ]
]

{ #category : #evaluation }
JSAjaxCallback >> evaluateWithArgument: anObject [
	block isNil
		ifFalse: [ block valueWithPossibleArguments: (Array with: anObject) ].
	self requestContext
		respond: [ :response | response doNotCache ]
]

{ #category : #accessing }
JSAjaxCallback >> priority [
	^ 5
]
