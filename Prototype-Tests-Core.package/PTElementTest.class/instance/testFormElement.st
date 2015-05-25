tests-form
testFormElement
	self
		assert: self formElement activate
		equals: '$(this).activate()'.
	self
		assert: self formElement clear
		equals: '$(this).clear()'.
	self
		assert: self formElement disable
		equals: '$(this).disable()'.
	self
		assert: self formElement enable
		equals: '$(this).enable()'.
	self
		assert: self formElement focus
		equals: '$(this).focus()'.
	self
		assert: self formElement present
		equals: '$(this).present()'.
	self
		assert: self formElement select
		equals: '$(this).select()'.
	self
		assert: (self formElement id: 'foo'; serialize)
		equals: '$("foo").serialize()'.
	self
		assert: (self formElement id: 'foo'; value)
		equals: '$("foo").getValue()'