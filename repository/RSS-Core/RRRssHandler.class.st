"
A RRRssHandler is an entry point that generates an RSS feed.

"
Class {
	#name : #RRRssHandler,
	#superclass : #WARequestHandler,
	#category : 'RSS-Core'
}

{ #category : #accessing }
RRRssHandler class >> description [
	^ 'RSS feed'
]

{ #category : #private }
RRRssHandler >> createDocumentRoot [
	^ RRRssRoot new
		charSet: self requestContext charSet;
		yourself
]

{ #category : #private }
RRRssHandler >> createRootComponent [
	^ self rootComponentClass new
]

{ #category : #configuration }
RRRssHandler >> defaultConfiguration [
	^ super defaultConfiguration
		addParent: RRSystemConfiguration instance;
		yourself
]

{ #category : #handling }
RRRssHandler >> handleFiltered: aRequestContext [
	| document context canvas root rootComponent |
	self setContentType: aRequestContext response.
	document := aRequestContext newDocument.
	root := self createDocumentRoot.
	context := WARenderContext new document: document.
	[ canvas := RRRssRenderCanvas context: context.
	rootComponent := self createRootComponent.
	
	rootComponent updateRoot: root.
	document open: root.
	canvas render: rootComponent.
		
	document close ] ensure: [ context destroy ].
	aRequestContext respond
]

{ #category : #initialization }
RRRssHandler >> initialize [
	super initialize.
	self addFilter: WAExceptionFilter new
]

{ #category : #configuration }
RRRssHandler >> rootComponentClass [
	^ (self preferenceAt: #rootComponentClass) value
]

{ #category : #configuration }
RRRssHandler >> rootComponentClass: aClass [
	^ self preferenceAt: #rootComponentClass put: (GRPlatform current bindingOf: aClass)
]

{ #category : #private }
RRRssHandler >> setContentType: aResponse [
	| contentType |
	contentType := WAMimeType applicationRssXml
		charset: self requestContext charSet;
		yourself.
	aResponse contentType: contentType
]
