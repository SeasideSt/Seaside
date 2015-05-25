tests
testResponders
	self
		assert: (self responders)
		equals: 'Ajax.Responders.register({})'.
	self
		assert: (self responders register)
		equals: 'Ajax.Responders.register({})'.
	self
		assert: (self responders unregister)
		equals: 'Ajax.Responders.unregister({})'.
	self
		assert: (self responders onCreate: 1)
		equals: 'Ajax.Responders.register({"onCreate":function(){1}})'.
	self
		assert: (self responders onComplete: 2)
		equals: 'Ajax.Responders.register({"onComplete":function(){2}})'