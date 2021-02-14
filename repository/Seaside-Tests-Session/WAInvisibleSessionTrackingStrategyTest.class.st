Class {
	#name : #WAInvisibleSessionTrackingStrategyTest,
	#superclass : #WASessionTrackingStrategyTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #testing }
WAInvisibleSessionTrackingStrategyTest class >> isAbstract [
	^ self name = #WAInvisibleSessionTrackingStrategyTest
]

{ #category : #private }
WAInvisibleSessionTrackingStrategyTest >> sessionId [
	self subclassResponsibility
]

{ #category : #tests }
WAInvisibleSessionTrackingStrategyTest >> testAddKeyOfSessionToContext [
	| context |
	context := self requestContext.
	strategy addKey: 'The_Metaphor' toContext: context.
	self assertNoCookies: context
]

{ #category : #tests }
WAInvisibleSessionTrackingStrategyTest >> testAddKeyOfSessionToUrl [
	| context uri |
	context := self requestContext.
	uri := context request uri copy.
	strategy addKey: 'The_Metaphor' toUrl: uri.
	self assert: uri greaseString = '/catspajamassc2'
]

{ #category : #tests }
WAInvisibleSessionTrackingStrategyTest >> testKeyFromIpAddress [
	| context actual |
	context := self requestContext.
	actual := strategy keyFromContext: context.
	self assert: actual = self sessionId
]

{ #category : #tests }
WAInvisibleSessionTrackingStrategyTest >> testKeyFromQueryField [
	| context actual |
	context := self requestContext.
	context request uri addField: strategy keyField value: '4e232e46-003d2-04324-d3ac8fa8'.
	actual := strategy keyFromContext: context.
	self assert: actual = '4e232e46-003d2-04324-d3ac8fa8'
]

{ #category : #tests }
WAInvisibleSessionTrackingStrategyTest >> testNoHandlerFoundForDocumentHandlerKey [
	| context notified |
	context := self requestContext.
	strategy
		addKey: 'The_Birthday_Massacre'
		toUrl: context request uri copy.
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

{ #category : #tests }
WAInvisibleSessionTrackingStrategyTest >> testNoHandlerFoundForSessionKey [
	| context application cache session |
	context := self requestContext.
	application := self newApplication.
	[ strategy
		noHandlerFoundForKey: self sessionId
		in: application
		context: context ]
		on: WAResponseNotification
		do: [ :notification | "ignore" ].
	self assertOk: context.
	cache := application cache.
	self assert: cache size = 1.
	session := cache at: self sessionId ifAbsent: [ nil ].
	self deny: session isNil.
	self assert: session isSession
]
