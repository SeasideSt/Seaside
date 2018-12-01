"
WACookieForBrowserIPForCrawlerTrackingStrategy uses cookie based session tracking for browsers and IPs for crawlers (they don't support cookies). This way there is never a session key in any URL.

This is inspired by:
http://www.tomcatexpert.com/blog/2011/05/18/crawler-session-manager-valve
"
Class {
	#name : #WACookieForBrowserIPForCrawlerTrackingStrategy,
	#superclass : #WASessionTrackingStrategy,
	#instVars : [
		'cookieStrategy',
		'ipStrategy'
	],
	#category : 'Seaside-Session'
}

{ #category : #public }
WACookieForBrowserIPForCrawlerTrackingStrategy >> addKey: aString toContext: aRequestContext [
	^ (self strategyFor: aRequestContext)
		addKey: aString toContext: aRequestContext
]

{ #category : #public }
WACookieForBrowserIPForCrawlerTrackingStrategy >> addKey: aString toUrl: aUrl [
	^ (self strategyFor: WACurrentRequestContext value)
		addKey: aString toUrl: aUrl
]

{ #category : #private }
WACookieForBrowserIPForCrawlerTrackingStrategy >> crawlerSubStrings [
	^ #(
		'bot'
		'Bot'
		'Yahoo! Slurp'
		'Feedfetcher-Google'
	)
]

{ #category : #initialization }
WACookieForBrowserIPForCrawlerTrackingStrategy >> initialize [
	super initialize.
	ipStrategy := WAIPSessionTrackingStrategy new.
	cookieStrategy := WACookieOnlySessionTrackingStrategy new
]

{ #category : #private }
WACookieForBrowserIPForCrawlerTrackingStrategy >> isFromCrawler: aRequestContext [
	| userAgent |
	userAgent := aRequestContext request userAgent.
	^ userAgent notNil and: [ self crawlerSubStrings anySatisfy: [ :each |
			(userAgent indexOfSubCollection: each) > 0 ] ]
]

{ #category : #public }
WACookieForBrowserIPForCrawlerTrackingStrategy >> keyFromContext: aRequestContext [
	^ (self strategyFor: aRequestContext)
		keyFromContext: aRequestContext
]

{ #category : #public }
WACookieForBrowserIPForCrawlerTrackingStrategy >> noHandlerFoundForKey: aString in: anApplication context: aRequestContext [
	^ (self strategyFor: aRequestContext)
		noHandlerFoundForKey: aString in: anApplication context: aRequestContext
]

{ #category : #private }
WACookieForBrowserIPForCrawlerTrackingStrategy >> strategyFor: aRequestContext [
	^ (self isFromCrawler: aRequestContext)
		ifTrue: [ ipStrategy ]
		ifFalse: [ cookieStrategy ]
]
