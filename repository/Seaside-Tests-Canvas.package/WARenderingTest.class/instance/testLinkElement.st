tests
testLinkElement
	self
		assert: [ :html |
			html stylesheet
				addAural;
				addTeletype;
				title: 'aTilte';
				url: 'http://example.com/style.css'  ]
		gives: '<title></title><link rel="stylesheet" type="text/css" media="aural, tty" title="aTilte" href="http://example.com/style.css"/>'