tests-events
testDelegate
	self
		assert: ((self jQuery: 'table') delegate: 'td' on: 'hover' do: (self jQuery this toggleClass: 'hover'))
		equals: self function , '("table").on("hover","td",function(){' , self function , '(this).toggleClass("hover")})'.
	self
		assert: ((self jQuery: 'table') delegate: 'td' on: 'hover' data: 123 do: (self jQuery this toggleClass: 'hover'))
		equals: self function , '("table").on("hover","td",123,function(){' , self function , '(this).toggleClass("hover")})'