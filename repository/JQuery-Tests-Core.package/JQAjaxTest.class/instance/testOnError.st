tests-events
testOnError
	self
		assert: (self jQuery ajax onError: (self javascript alert: 'error'))
		equals: self function , '.ajax({"error":function(){alert("error")}})'