tests-attributes
testImageTag
	self
		assert: [ :html | html image resourceUrl: 'logo.jpeg' ]
		gives: '<img alt="" src="',self resourceBaseUrl,'logo.jpeg"/>'