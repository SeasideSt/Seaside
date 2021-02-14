Class {
	#name : #RRRenderTest,
	#superclass : #TestCase,
	#category : 'RSS-Tests-Core'
}

{ #category : #accessing }
RRRenderTest class >> packageNamesUnderTest [
	^ #('RSS-Core')
]

{ #category : #running }
RRRenderTest >> performTest [
	| context |
	context := WARequestContext 
		request: nil
		response: nil
		codec: GRNullCodec new.
	WACurrentRequestContext 
		use: context
		during: [ super performTest ]
]

{ #category : #private }
RRRenderTest >> render: aBlock [
	^ RRRssRenderCanvas builder render: aBlock
]

{ #category : #private }
RRRenderTest >> renderFull: aBlock [
	^ self renderFull: aBlock rootBlock: nil
]

{ #category : #private }
RRRenderTest >> renderFull: aBlock rootBlock: anObject [
	^ RRRssRenderCanvas builder
		fullDocument: true;
		rootBlock: anObject;
		render: aBlock
]

{ #category : #tests }
RRRenderTest >> testEmail [
	| actual expected |
	actual := self render: [ :rss |
		rss author: (WAEmailAddress address: 'joesmith@example.com' username: 'Joe Smith') ].
	expected := '<author>Joe Smith &lt;joesmith@example.com&gt;</author>'.
	self assert: actual = expected
]

{ #category : #tests }
RRRenderTest >> testExample [
	| actualContent expectedContent |
	actualContent := self render: [ :rss |
		rss description: 'Das super geile Blog.'.
		rss contentEncoded: '<p>Das super geile Blog.</p>'.
		rss generator: 'Pier 1.0.9-alpha'.
		rss language english ].
	expectedContent := '<description>Das super geile Blog.</description><content:encoded><![CDATA[<p>Das super geile Blog.</p>]]></content:encoded><generator>Pier 1.0.9-alpha</generator><language>en</language>'.
	self assert: actualContent = expectedContent
]

{ #category : #tests }
RRRenderTest >> testRenderExample [
	| actualContent expectedContent |
	actualContent := self render: [ :rss |
		rss description: 'Das super geile Blog.'.
		rss renderContentEncoded: [ :html |
			html paragraph:  'Das super geile Blog.' ].
		rss generator: 'Pier 1.0.9-alpha'.
		rss language english ].
	expectedContent := '<description>Das super geile Blog.</description><content:encoded>&lt;p&gt;Das super geile Blog.&lt;/p&gt;</content:encoded><generator>Pier 1.0.9-alpha</generator><language>en</language>'.
	self assert: actualContent = expectedContent
]

{ #category : #tests }
RRRenderTest >> testRenderExampleFull [
	| actualContent expectedContent |
	actualContent := self
		renderFull: [ :rss |
			rss description: 'Das super geile Blog.'.
			rss renderContentEncoded: [ :html |
				html paragraph:  'Das super geile Blog.' ].
			rss generator: 'Pier 1.0.9-alpha'.
			rss language english ]
		rootBlock: [ :root |
			root stylesheet beCss; url: 'http://yourserver.com/path/rss.css' ].
	
	expectedContent := '<?xml version="1.0" encoding="UTF-8"?><?xml-stylesheet type="text/css" href="http://yourserver.com/path/rss.css"?><rss version="2.0" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/"><channel><description>Das super geile Blog.</description><content:encoded>&lt;p&gt;Das super geile Blog.&lt;/p&gt;</content:encoded><generator>Pier 1.0.9-alpha</generator><language>en</language></channel></rss>'.
	self assert: actualContent = expectedContent
]

{ #category : #tests }
RRRenderTest >> testWithLineBreaks [
	| actualContent expectedContent |
	actualContent := self render: [ :rss |
		rss withLineBreaks: 'das', GRPlatform current newline, 'super', GRPlatform current newline, 'geile', GRPlatform current newline, 'Blog' ].
	expectedContent := 'das&lt;br/&gt;super&lt;br/&gt;geile&lt;br/&gt;Blog'.
	self assert: actualContent = expectedContent
]
