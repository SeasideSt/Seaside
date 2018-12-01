Class {
	#name : #WAActionCallback,
	#superclass : #WACallback,
	#instVars : [
		'block'
	],
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #accessing }
WAActionCallback >> block: aZeroOrOneArgBlock [
	block := aZeroOrOneArgBlock fixCallbackTemps
]

{ #category : #evaluation }
WAActionCallback >> evaluateWithArgument: anObject [
	block valueWithPossibleArguments: (Array with: anObject).
	self signalRenderNotification
]

{ #category : #testing }
WAActionCallback >> isEnabledFor: aRequestContext [
	^ aRequestContext request isXmlHttpRequest not
]

{ #category : #accessing }
WAActionCallback >> priority [
	^ 5
]

{ #category : #evaluation }
WAActionCallback >> signalRenderNotification [
	WARenderNotification signal
]
