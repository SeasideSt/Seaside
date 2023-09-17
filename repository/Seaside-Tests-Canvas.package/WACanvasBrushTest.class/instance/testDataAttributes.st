tests-attributes
testDataAttributes

	self
		assert: [ :html | html div dataAttributeAt: 'foo' put: 'bar' ]
		gives: '<div data-foo="bar"></div>'.
	self
		assert: [ :html | html div dataAttributeAt: 'foo' put: 'bar' if: true ]
		gives: '<div data-foo="bar"></div>'.
	self
		assert: [ :html | html div dataAttributeAt: 'foo' put: 'bar' if: false ]
		gives: '<div></div>'.
	self
		assert: [ :html | html div dataAttributeAt: 'boolean' put: true ]
		gives: '<div data-boolean></div>'.
	self
		assert: [ :html | html div dataAttributeAt: 'boolean' put: false ]
		gives: '<div></div>'