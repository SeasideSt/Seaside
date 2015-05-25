tests
testAtPut
	self
		assert: [ :attr | attr at: 'id' put: 'foo' ]
		gives: ' id="foo"'.
	self
		assert: [ :attr | attr at: 'tabindex' put: 6 ]
		gives: ' tabindex="6"'.
	self
		assert: [ :attr | attr at: 'checked' put: true ]
		gives: ' checked="checked"'.
	self
		assert: [ :attr | attr at: 'readonly' put: false ]
		gives: ''.
	self
		assert: [ :attr | attr at: 'disabled' put: nil ]
		gives: ''