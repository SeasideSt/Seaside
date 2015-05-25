tests-events
testOnSuccess
	self
		assert: (self jQuery ajax onSuccess: (self javascript alert: 'success'))
		equals: self function , '.ajax({"success":function(){alert("success")}})'