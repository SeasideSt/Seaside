tests-attributes
testCoreAttributesClass
	self
		assert: [ :html | html div class: 'foo' ]
		gives: '<div class="foo"></div>'.
	self
		assert: [ :html | html div class: 'foo'; class: 'bar' ]
		gives: '<div class="foo bar"></div>'