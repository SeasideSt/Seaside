tests-attributes
testCoreAttributesId
	self
		assert: [ :html | html div id: 'foo' ]
		gives: '<div id="foo"></div>'.
	self
		assert: [ :html | html div id: 'foo'; id: 'bar' ]
		gives: '<div id="bar"></div>'.
	self
		assert: [ :html | self assert: (html div id: 'foo'; id) = 'foo' ]
		gives: '<div id="foo"></div>'.
	self
		assert: [ :html | self assert: (html div id) isNil ]
		gives: '<div></div>'