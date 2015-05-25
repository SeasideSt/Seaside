tests-events
testEventActions
	self
		assert: (self event stop)
		equals: 'Event.stop(event)'.
	self
		assert: (self event observe: 'foo' on: 'click' do: self element toggle)
		equals: 'Event.observe("foo","click",function(event){$(this).toggle()})'