tests-attributes
testAbsoluteHttpsUrl
	self
		assert: [ :html | html anchor resourceUrl: 'https://www.google.com/track.js' ]
		gives: '<a href="https://www.google.com/track.js"></a>'