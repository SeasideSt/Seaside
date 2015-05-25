tests-attributes
testFileNameWithHttp
	self
		assert: [ :html | html image resourceUrl: 'http.gif' ]
		gives: '<img alt="" src="',self resourceBaseUrl,'http.gif"/>'