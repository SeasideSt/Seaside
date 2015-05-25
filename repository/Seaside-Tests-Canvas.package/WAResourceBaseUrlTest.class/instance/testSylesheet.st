tests-attributes
testSylesheet
	self
		assertRoot: [ :html | html stylesheet resourceUrl: 'main.css' ]
		gives: '<link rel="stylesheet" type="text/css" href="',self resourceBaseUrl,'main.css"/>'