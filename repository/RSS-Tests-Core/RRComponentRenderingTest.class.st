Class {
	#name : #RRComponentRenderingTest,
	#superclass : #WAContextTest,
	#instVars : [
		'handler'
	],
	#category : 'RSS-Tests-Core'
}

{ #category : #configuration }
RRComponentRenderingTest >> createHandlers [
	^ Array with: handler
]

{ #category : #running }
RRComponentRenderingTest >> setUp [
	handler := RRRssHandler new
		rootComponentClass: RRTestComponent;
		yourself
]

{ #category : #tests }
RRComponentRenderingTest >> testUpdateRoot [
	 | response |
	[ handler handleFiltered: self requestContext ]
		on: WAResponseNotification
		do: [ :notification | "ignore" ].
	response := self requestContext response.
	self assert: response status = 200.
	self assert: '<?xml version="1.0" encoding="utf-8"?>',
		'<?xml-stylesheet type="text/xsl" href="http://www.seaside.st/feed.xsl"?>',
		'<rss version="2.0" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/">',
		'<channel></channel></rss>' = response contents
]
