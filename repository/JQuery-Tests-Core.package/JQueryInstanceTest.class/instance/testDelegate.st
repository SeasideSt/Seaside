tests-events
testDelegate
	self
		assert: ((self jQuery: 'table') delegate: 'td' on: 'hover' do: (self jQuery this toggleClass: 'hover'))
		equals: self function , '("table").delegate("td","hover",function(){' , self function , '(this).toggleClass("hover")})'.
	self
		assert: ((self jQuery: 'table') delegate: 'td' on: 'hover' data: 123 do: (self jQuery this toggleClass: 'hover'))
		equals: self function , '("table").delegate("td","hover",123,function(){' , self function , '(this).toggleClass("hover")})'