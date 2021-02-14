Class {
	#name : #RRRssRoot,
	#superclass : #WAXmlRoot,
	#instVars : [
		'rssAttributes',
		'channelAttributes',
		'styles'
	],
	#category : 'RSS-Core'
}

{ #category : #accessing }
RRRssRoot >> channelAttributes [
	^ channelAttributes
]

{ #category : #writing }
RRRssRoot >> closeOn: aDocument [
	self writeFootOn: aDocument.
	super closeOn: aDocument
]

{ #category : #initialization }
RRRssRoot >> initialize [
	
	super initialize.
	rssAttributes := WAHtmlAttributes new
		at: 'version' put: '2.0';
		at: 'xmlns:content' put: 'http://purl.org/rss/1.0/modules/content/';
		at: 'xmlns:wfw' put: 'http://wellformedweb.org/CommentAPI/';
		at: 'xmlns:dc' put: 'http://purl.org/dc/elements/1.1/';
		yourself.
	channelAttributes := WAHtmlAttributes new
]

{ #category : #writing }
RRRssRoot >> openOn: aDocument [
	super openOn: aDocument.
	self writeHeadOn: aDocument
]

{ #category : #accessing }
RRRssRoot >> rssAttributes [
	^ rssAttributes
]

{ #category : #accessing }
RRRssRoot >> styles [
	^ styles ifNil: [ styles := OrderedCollection new ]
]

{ #category : #elements }
RRRssRoot >> stylesheet [
	"http://interglacial.com/~sburke/stuff/pretty_rss.html"
	^ self styles add: (RRXmlStyleSheet root: self)
]

{ #category : #writing }
RRRssRoot >> writeFootOn: aDocument [
	aDocument closeTag: 'channel'.
	aDocument closeTag: 'rss'
]

{ #category : #writing }
RRRssRoot >> writeHeadOn: aDocument [
	self writeStylesOn: aDocument.
	
	aDocument openTag: 'rss' attributes: rssAttributes.
	aDocument openTag: 'channel' attributes: channelAttributes
]

{ #category : #writing }
RRRssRoot >> writeStylesOn: aDocument [
	styles isNil
		ifTrue: [ ^ self ].
	styles do: [ :each | aDocument print: each ]
]
