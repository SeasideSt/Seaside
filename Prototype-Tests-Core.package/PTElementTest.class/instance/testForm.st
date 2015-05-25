tests-form
testForm
	self
		assert: self form disable
		equals: '$(this).disable()'.
	self
		assert: self form enable
		equals: '$(this).enable()'.
	self
		assert: self form findFirstElement
		equals: '$(this).findFirstElement()'.
	self
		assert: self form focusFirstElement
		equals: '$(this).focusFirstElement()'.
	self
		assert: self form request
		equals: '$(this).request()'.
	self
		assert: self form reset
		equals: '$(this).reset()'.
	self
		assert: (self form id: 'foo'; serialize)
		equals: '$("foo").serialize()'