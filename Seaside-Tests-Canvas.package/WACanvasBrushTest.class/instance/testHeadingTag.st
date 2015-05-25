tests-tags
testHeadingTag
	self
		assert: [ :html | html heading ]
		gives: '<h1></h1>'.
	self
		assert: [ :html | html heading level: 2; with: 'foo' ]
		gives: '<h2>foo</h2>'.
	self
		assert: [ :html | html heading level: 0; with: 'foo' ]
		gives: '<h1>foo</h1>'.
	self
		assert: [ :html | html heading level: 7; with: 'foo' ]
		gives: '<h6>foo</h6>'