tests-tags
testLabelTag
	self
		assert: [ :html | html label: 'foo' ]
		gives: '<label>foo</label>'.
	self
		assert: [ :html | html label for: 'bar'; with: 'zork' ]
		gives: '<label for="bar">zork</label>'