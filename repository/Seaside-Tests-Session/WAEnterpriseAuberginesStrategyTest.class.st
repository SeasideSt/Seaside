Class {
	#name : #WAEnterpriseAuberginesStrategyTest,
	#superclass : #WACookieSessionTrackingStrategyTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #private }
WAEnterpriseAuberginesStrategyTest >> newStrategy [
	^ WAEnterpriseAuberginesStrategy new
]

{ #category : #tests }
WAEnterpriseAuberginesStrategyTest >> testAddKeyOfSessionToUrl [
	| context uri |
	context := self requestContext.
	uri := context request uri copy.
	strategy addKey: 'The_Metaphor' toUrl: uri.
	self assert: uri greaseString = '/1/2;jsessionid=The_Metaphor'
]

{ #category : #tests }
WAEnterpriseAuberginesStrategyTest >> testAddKeyOfSessionToUrlCookieAlreadyPresent [
	| context uri cookie1 |
	context := self requestContext.
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'The_Metaphor'.
	context request setCookies: (Array with: cookie1).
	uri := context request uri copy.
	strategy addKey: 'The_Metaphor' toUrl: uri.
	self assert: uri greaseString = '/1/2'
]

{ #category : #tests }
WAEnterpriseAuberginesStrategyTest >> testQueryFieldOverridesCookie [
	| cookie1 key context |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'cookie1'.
	context := self requestContext.
	context request setCookies: (Array with: cookie1).
	context request uri addPathParameterAt: context request uri path size key: strategy keyField value: 'value1'. 
	
	key := strategy keyFromContext: context.
	self assert: key = 'value1'
]
