tests-attributes
testAbsoluteFtpUrl
	self
		assert: [ :html | html anchor resourceUrl: 'ftp://www.google.com/track.js' ]
		gives: '<a href="ftp://www.google.com/track.js"></a>'