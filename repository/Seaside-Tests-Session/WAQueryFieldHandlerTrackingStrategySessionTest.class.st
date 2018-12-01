"
I test all the session related behavior of WAQueryFieldHandlerTrackingStrategy that can't be tested in WAQueryFieldHandlerTrackingStrategyTest for dependency reasons.
"
Class {
	#name : #WAQueryFieldHandlerTrackingStrategySessionTest,
	#superclass : #WASessionTrackingStrategyTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #private }
WAQueryFieldHandlerTrackingStrategySessionTest >> newStrategy [
	^ WAQueryFieldHandlerTrackingStrategy new
]

{ #category : #tests }
WAQueryFieldHandlerTrackingStrategySessionTest >> testAddKeyToContext [
	| context |
	context := self requestContext.
	strategy addKey: 'The_Metaphor' toContext: context.
	self assertNoCookies: context
]

{ #category : #tests }
WAQueryFieldHandlerTrackingStrategySessionTest >> testAddKeyToUrl [
	| context uri |
	context := self requestContext.
	uri := context request uri copy.
	strategy addKey: 'The_Metaphor' toUrl: uri.
	self assert: uri greaseString = '/catspajamassc2?_s=The_Metaphor'
]

{ #category : #tests }
WAQueryFieldHandlerTrackingStrategySessionTest >> testNoHandlerFoundForKey [
	| context notified |
	context := self requestContext.
	notified := false.
	[ strategy
		noHandlerFoundForKey: 'The_Birthday_Massacre'
		in: self newApplication
		context: context ]
		on: WAResponseNotification
		do: [ :notification | notified := true ].
	self assert: notified.
	self assertNotFound: context
]
