tests-tags
testImageTag
	self
		assert: [ :html | html image url: 'http://www.seaside.st/logo.jpeg' ]
		gives: '<img alt="" src="http://www.seaside.st/logo.jpeg"/>'.
		
	self
		assert: [ :html |
			html image
				title: 'Seaside';
				altText: 'the Seaside logo';
				url: 'http://www.seaside.st/logo.jpeg' ]
		gives: '<img alt="the Seaside logo" title="Seaside" src="http://www.seaside.st/logo.jpeg"/>'