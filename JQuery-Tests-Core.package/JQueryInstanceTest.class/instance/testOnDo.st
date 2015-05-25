tests-events
testOnDo
	self
		assert: ((self jQuery: 'a') on: 'click' do: (self javascript alert: 'Clicked'))
		equals: self function , '("a").on("click",function(){alert("Clicked")})'.
	self
		assert: ((self jQuery: 'a') on: 'click' selector: 'div' do: (self javascript alert: 'Clicked'))
		equals: self function , '("a").on("click","div",function(){alert("Clicked")})'