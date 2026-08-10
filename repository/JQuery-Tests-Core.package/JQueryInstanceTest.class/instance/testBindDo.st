tests-events
testBindDo
	self
		assert: ((self jQuery: 'a') bind: 'click' do: (self javascript alert: 'Clicked'))
		equals: self function , '("a").on("click",function(){alert("Clicked")})'.
	self
		assert: ((self jQuery: 'a') bind: 'click' data: Dictionary new do: (self javascript alert: 'Clicked'))
		equals: self function , '("a").on("click",{},function(){alert("Clicked")})'