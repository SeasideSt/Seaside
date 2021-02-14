Class {
	#name : #WAResourceBaseUrlTest,
	#superclass : #WAAbstractCanvasBrushTest,
	#category : 'Seaside-Tests-Canvas'
}

{ #category : #private }
WAResourceBaseUrlTest >> assertRoot: aBlock gives: aString [
	| html |
	html := self builder
		fullDocument: true;
		rootBlock: aBlock;
		render: [ :canvas | ].
	self assert: html = ('<html><head><title></title>', aString, '</head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>')
]

{ #category : #private }
WAResourceBaseUrlTest >> builder [
	^ super builder
		resourceUrl: (WAUrl absolute: self resourceBaseUrl);
		yourself
]

{ #category : #private }
WAResourceBaseUrlTest >> resourceBaseUrl [
	^ 'https://www.seaside.st/resources/'
]

{ #category : #'tests-attributes' }
WAResourceBaseUrlTest >> testAbsoluteFtpUrl [
	self
		assert: [ :html | html anchor resourceUrl: 'ftp://www.google.com/track.js' ]
		gives: '<a href="ftp://www.google.com/track.js"></a>'
]

{ #category : #'tests-attributes' }
WAResourceBaseUrlTest >> testAbsoluteHttpUrl [
	self
		assert: [ :html | html anchor resourceUrl: 'http://www.google.com/track.js' ]
		gives: '<a href="http://www.google.com/track.js"></a>'
]

{ #category : #'tests-attributes' }
WAResourceBaseUrlTest >> testAbsoluteHttpsUrl [
	self
		assert: [ :html | html anchor resourceUrl: 'https://www.google.com/track.js' ]
		gives: '<a href="https://www.google.com/track.js"></a>'
]

{ #category : #'tests-attributes' }
WAResourceBaseUrlTest >> testFileNameWithHttp [
	self
		assert: [ :html | html image resourceUrl: 'http.gif' ]
		gives: '<img alt="" src="',self resourceBaseUrl,'http.gif"/>'
]

{ #category : #'tests-attributes' }
WAResourceBaseUrlTest >> testImageTag [
	self
		assert: [ :html | html image resourceUrl: 'logo.jpeg' ]
		gives: '<img alt="" src="',self resourceBaseUrl,'logo.jpeg"/>'
]

{ #category : #'tests-attributes' }
WAResourceBaseUrlTest >> testRootScript [
	self
		assertRoot: [ :html | html javascript resourceUrl: 'main.js' ]
		gives: '<script type="text/javascript" src="',self resourceBaseUrl,'main.js"></script>'
]

{ #category : #'tests-tags' }
WAResourceBaseUrlTest >> testScriptTag [
	self
		assert: [ :html | html script resourceUrl: 'track.js' ]
		gives: '<script src="',self resourceBaseUrl,'track.js" type="text/javascript"></script>'
]

{ #category : #'tests-attributes' }
WAResourceBaseUrlTest >> testSylesheet [
	self
		assertRoot: [ :html | html stylesheet resourceUrl: 'main.css' ]
		gives: '<link rel="stylesheet" type="text/css" href="',self resourceBaseUrl,'main.css"/>'
]
