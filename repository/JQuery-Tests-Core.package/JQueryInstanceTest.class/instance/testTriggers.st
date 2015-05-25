tests-events
testTriggers
	self
		assert: ((self jQuery: 'a') triggerBlur)
		equals: self function , '("a").blur()'.
	self
		assert: ((self jQuery: 'a') triggerChange)
		equals: self function , '("a").change()'.
	self
		assert: ((self jQuery: 'a') triggerClick)
		equals: self function , '("a").click()'.
	self
		assert: ((self jQuery: 'a') triggerDoubleClick)
		equals: self function , '("a").dblclick()'.
	self
		assert: ((self jQuery: 'a') triggerError)
		equals: self function , '("a").error()'.
	self
		assert: ((self jQuery: 'a') triggerFocus)
		equals: self function , '("a").focus()'.
	self
		assert: ((self jQuery: 'a') triggerKeyDown)
		equals: self function , '("a").keydown()'.
	self
		assert: ((self jQuery: 'a') triggerKeyPress)
		equals: self function , '("a").keypress()'.
	self
		assert: ((self jQuery: 'a') triggerKeyUp)
		equals: self function , '("a").keyup()'.
	self
		assert: ((self jQuery: 'a') triggerSelect)
		equals: self function , '("a").select()'.
	self
		assert: ((self jQuery: 'a') triggerSubmit)
		equals: self function , '("a").submit()'