tests-attributes
testAbsoluteHttpUrl
	self
		assert: [ :html | html anchor resourceUrl: 'http://www.google.com/track.js' ]
		gives: '<a href="http://www.google.com/track.js"></a>'