tests-attributes
testRootScript
	self
		assertRoot: [ :html | html javascript resourceUrl: 'main.js' ]
		gives: '<script type="text/javascript" src="',self resourceBaseUrl,'main.js"></script>'