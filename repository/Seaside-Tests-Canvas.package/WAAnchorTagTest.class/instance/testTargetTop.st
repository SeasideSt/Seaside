tests
testTargetTop
	self
		assert: [ :html | 
			html anchor
				callback: [  ];
				targetTop;
				with: 'foo' ]
		gives: '<a target="_top" href="/?1">foo</a>'