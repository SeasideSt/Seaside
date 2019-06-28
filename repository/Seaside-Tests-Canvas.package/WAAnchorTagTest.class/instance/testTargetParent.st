tests
testTargetParent
	self
		assert: [ :html | 
			html anchor
				callback: [  ];
				targetParent;
				with: 'foo' ]
		gives: '<a target="_parent" href="/?1">foo</a>'