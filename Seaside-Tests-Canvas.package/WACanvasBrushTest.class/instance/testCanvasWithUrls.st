tests-encoding
testCanvasWithUrls
	self
		assert: [ :html | html withUrls: 'This is http://www.seaside.st online.' ]
		gives: 'This is <a href="http://www.seaside.st">http://www.seaside.st</a> online.'