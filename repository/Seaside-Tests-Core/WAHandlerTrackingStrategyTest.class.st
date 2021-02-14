Class {
	#name : #WAHandlerTrackingStrategyTest,
	#superclass : #WAContextTest,
	#instVars : [
		'strategy'
	],
	#category : 'Seaside-Tests-Core-RequestHandling'
}

{ #category : #testing }
WAHandlerTrackingStrategyTest class >> isAbstract [
	^ self name = #WAHandlerTrackingStrategyTest
]

{ #category : #private }
WAHandlerTrackingStrategyTest >> assertCookieInContext: aRequestContext withValue: aString [
	| cookies cookie |
	cookies := aRequestContext response cookies.
	self assert: cookies size = 1.
	cookie := cookies first.
	self assert: cookie key = strategy keyCookieName.
	self assert: cookie value = aString
]

{ #category : #private }
WAHandlerTrackingStrategyTest >> assertNoCookies: aRequestContext [
	self assert: aRequestContext response cookies isEmpty
]

{ #category : #configuration }
WAHandlerTrackingStrategyTest >> createRequest [
	^ WARequest method: 'GET' uri: '/catspajamassc2'
]

{ #category : #private }
WAHandlerTrackingStrategyTest >> newDocumentHandler [
	^ WADocumentHandler document: 'WADocumentHandler document: document'
]

{ #category : #private }
WAHandlerTrackingStrategyTest >> newStrategy [
	self subclassResponsibility
]

{ #category : #running }
WAHandlerTrackingStrategyTest >> setUp [
	super setUp.
	strategy := self newStrategy
]
