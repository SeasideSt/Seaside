Class {
	#name : #WACookieOnlySessionTrackingStrategyTest,
	#superclass : #WACookieSessionTrackingStrategyTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #private }
WACookieOnlySessionTrackingStrategyTest >> newStrategy [
	^ WACookieOnlySessionTrackingStrategy new
]

{ #category : #tests }
WACookieOnlySessionTrackingStrategyTest >> testAddKeyOfSessionToUrl [
	| context uri |
	context := self requestContext.
	uri := context request uri copy.
	strategy addKey: 'The_Metaphor' toUrl: uri.
	self assert: uri greaseString = '/1/2'
]
