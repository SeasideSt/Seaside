tests-events
testOnBeforeSend
	self
		assert: (self jQuery ajax onBeforeSend: (self javascript alert: 'before'))
		equals: self function , '.ajax({"beforeSend":function(){alert("before")}})'