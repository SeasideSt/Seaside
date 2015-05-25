tests-events
testOneDo
	self
		assert: ((self jQuery: 'a') one: 'click' do: (self javascript alert: 'Clicked'))
		equals: self function , '("a").one("click",function(){alert("Clicked")})'