tests-events
testEventOnDo
	self
		assert: (self element on: 'click' do: self event stop)
		equals: '$(this).observe("click",function(event){Event.stop(event)})'.
	self
		assert: (self element id: 'foo'; on: 'mouseout' do: self element hide)
		equals: '$("foo").observe("mouseout",function(event){$(this).hide()})'