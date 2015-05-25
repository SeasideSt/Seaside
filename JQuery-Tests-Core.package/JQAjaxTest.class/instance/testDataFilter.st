tests-options
testDataFilter
	self
		assert: (self ajax dataFilter: (self javascript alert: 'Hello'))
		equals: self function , '.ajax({"dataFilter":function(){return alert("Hello")}})'