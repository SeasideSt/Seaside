tests-tags
testEditTag
	self
		assert: [ :html | html inserted: 'foo' ]
		gives: '<ins>foo</ins>'.
	self
		assert: [ :html | html deleted: 'bar' ]
		gives: '<del>bar</del>'