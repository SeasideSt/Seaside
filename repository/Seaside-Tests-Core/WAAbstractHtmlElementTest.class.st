Class {
	#name : #WAAbstractHtmlElementTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-Core-Document'
}

{ #category : #testing }
WAAbstractHtmlElementTest class >> isAbstract [
	^ self name = #WAAbstractHtmlElementTest
]

{ #category : #private }
WAAbstractHtmlElementTest >> assert: aBlock gives: aString [
	| html |
	html := String streamContents: [ :stream |
		| context root document |
		document := WAHtmlDocument on: stream.
		context := WARenderContext new
			actionUrl: WAUrl new;
			document: document;
			yourself.
		 root := WAHtmlRoot context: context.
		 aBlock value: root.
		document open: root.
		document close ].
	self
		assert: html = ('<html><head><title></title>', aString, '</head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>')
		description:	'Expected: ' , aString printString , ', Actual: ' , html printString
		resumable: true
]
