tests-tags-anchors
testAnchorAttributes
	self
		assert: [ :html | html anchor charset: 'utf-8' ]
		gives: '<a charset="utf-8"></a>'.
	self
		assert: [ :html | html anchor name: 'foo' ]
		gives: '<a name="foo"></a>'.
	self
		assert: [ :html | html anchor relationship: 'home' ]
		gives: '<a rel="home"></a>'.
	self
		assert: [ :html | html anchor relationship: 'home'; relationship: 'parent' ]
		gives: '<a rel="home parent"></a>'.
	self
		assert: [ :html | html anchor reverse: 'home' ]
		gives: '<a rev="home"></a>'.
	self
		assert: [ :html | html anchor reverse: 'home'; reverse: 'parent' ]
		gives: '<a rev="home parent"></a>'.
	self
		assert: [ :html | html anchor target: '_new' ]
		gives: '<a target="_new"></a>'.
	self
		assert: [ :html | html anchor type: 'text/plain' ]
		gives: '<a type="text/plain"></a>'