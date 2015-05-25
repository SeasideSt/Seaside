tests
testEnsureId
	self
		assert: [ :html | self assert: (html div ensureId = 'id1') ]
		gives: '<div id="id1"></div>'.
	self
		assert: [ :html | self assert: (html div id: 'foo'; ensureId) = 'foo' ]
		gives: '<div id="foo"></div>'