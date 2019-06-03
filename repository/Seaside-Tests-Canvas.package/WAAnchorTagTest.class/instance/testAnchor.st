tests-tags-anchors
testAnchor
	self
		assert: [ :html | html anchor ]
		gives: '<a></a>'.
	self
		assert: [ :html | html anchor callback: [ ]; with: 'foo' ]
		gives: '<a href="/?1">foo</a>'.
	self
		assert: [ :html |
			html anchor callback: [ ]; with: 'foo'.
			html anchor callback: [ ]; with: 'bar' ]
		gives: '<a href="/?1">foo</a><a href="/?2">bar</a>'.
	self
		assert: [ :html |
			html anchor
				extraPath: 'zork';
				callback: [ ];
				with: 'foo' ]
		gives: '<a href="/zork?1">foo</a>'.
	self
		assert: [ :html |
			html anchor
				extraParameters: 'zork';
				callback: [ ];
				with: 'foo' ]
		gives: '<a href="/?zork&amp;1">foo</a>'