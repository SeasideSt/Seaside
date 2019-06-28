tests
testTargetSelf
	self
		assert: [ :html | 
			html anchor
				callback: [  ];
				targetSelf;
				with: 'foo' ]
		gives: '<a target="_self" href="/?1">foo</a>'