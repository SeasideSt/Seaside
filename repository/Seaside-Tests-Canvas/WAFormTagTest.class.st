Class {
	#name : #WAFormTagTest,
	#superclass : #WACanvasBrushTest,
	#category : 'Seaside-Tests-Canvas'
}

{ #category : #private }
WAFormTagTest >> assertUserAgent: aString isInternetExplorer: aBoolean [
	self userAgent: aString.
	WAHtmlCanvas builder
		render: [ :html |
			self assert: html form isInternetExplorer = aBoolean ]
]

{ #category : #tests }
WAFormTagTest >> testBasicForm [
	self
		assert: [ :html |
			html basicForm ]
		gives: '<form accept-charset="utf-8" method="post" action="/"></form>'

]

{ #category : #tests }
WAFormTagTest >> testDefaultAction [
	self userAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.8.1.3) Gecko/20070309 Firefox/2.0.0.3'.
	self
		assert: [ :html |
			html form defaultAction: [  ] ]
		gives: '<form accept-charset="utf-8" method="post" action="/"><div><input tabindex="-1" value="Default" name="1" style="position: absolute; top: -100em" type="submit"/></div></form>'.
	
	self userAgent: 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)'.
	self
		assert: [ :html |
			html form
				defaultAction: [  ] ]
		gives: '<form accept-charset="utf-8" method="post" action="/"><div><input tabindex="-1" value="Default" name="1" style="position: absolute; top: -100em" type="submit"/><input tabindex="-1" name="2" style="position: absolute; top: -100em" type="text"/></div></form>'
]

{ #category : #tests }
WAFormTagTest >> testDefaultActionGet [
	self userAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.8.1.3) Gecko/20070309 Firefox/2.0.0.3'.
	self
		assert: [ :html |
			html form get; defaultAction: [  ] ]
		gives: '<form accept-charset="utf-8" method="get" action="/"><div><input tabindex="-1" value="Default" name="1" style="position: absolute; top: -100em" type="submit"/></div><div></div></form>'.
	
	self userAgent: 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)'.
	self
		assert: [ :html |
			html form get; defaultAction: [  ] ]
		gives: '<form accept-charset="utf-8" method="get" action="/"><div><input tabindex="-1" value="Default" name="1" style="position: absolute; top: -100em" type="submit"/><input tabindex="-1" name="2" style="position: absolute; top: -100em" type="text"/></div><div></div></form>'
]

{ #category : #tests }
WAFormTagTest >> testIsGet [
	self userAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.8.1.3) Gecko/20070309 Firefox/2.0.0.3'.
	self
		assert: [ :html | self assert: html form get isGet ]
		gives: '<form accept-charset="utf-8" method="get" action="/"><div></div></form>'
]

{ #category : #tests }
WAFormTagTest >> testIsInternetExplorer [
	self assertUserAgent: 'Mozilla/5.0 (compatible; Konqueror/3.2; Linux 2.6.2) (KHTML, like Gecko)' isInternetExplorer: false.
	self assertUserAgent: 'Mozilla/4.0 (compatible; MSIE 6.0; MSIE 5.5; Windows NT 5.1) Opera 7.04 [de]' isInternetExplorer: false.
	self assertUserAgent: 'Opera/9.10 (Windows NT 5.0; U; de)' isInternetExplorer: false.
	self assertUserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.0; de-DE; rv:1.6) Gecko/20040206 Firefox/1.0.1' isInternetExplorer: false.
	self assertUserAgent: 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506)' isInternetExplorer: true.
	self assertUserAgent: 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)' isInternetExplorer: true.
	self assertUserAgent: 'Lynx/2.8.4rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.6c' isInternetExplorer: false.
	self assertUserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.8.1.2) Gecko/20070222 SeaMonkey/1.1.1' isInternetExplorer: false.
	self assertUserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.8.1.3) Gecko/20070309 Firefox/2.0.0.3' isInternetExplorer: false
]

{ #category : #private }
WAFormTagTest >> userAgent: aString [
	self requestContext request headers at: 'user-agent' put: aString
]
