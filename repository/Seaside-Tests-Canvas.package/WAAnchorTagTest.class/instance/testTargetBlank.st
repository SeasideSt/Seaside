tests
testTargetBlank
	self
		assert: [ :html | 
			html anchor
				callback: [  ];
				targetBlank;
				with: 'foo' ]
		gives: '<a target="_blank" href="/?1">foo</a>'