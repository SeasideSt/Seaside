tests
testIsGet
	self userAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.8.1.3) Gecko/20070309 Firefox/2.0.0.3'.
	self
		assert: [ :html | self assert: html form get isGet ]
		gives: '<form accept-charset="utf-8" method="get" action="/"><div></div></form>'