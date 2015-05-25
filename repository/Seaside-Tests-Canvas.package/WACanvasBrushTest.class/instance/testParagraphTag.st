tests-tags
testParagraphTag
	self
		assert: [ :html | html paragraph ]
		gives: '<p></p>'.
	self
		assert: [ :html | html paragraph: 'foo' ]
		gives: '<p>foo</p>'