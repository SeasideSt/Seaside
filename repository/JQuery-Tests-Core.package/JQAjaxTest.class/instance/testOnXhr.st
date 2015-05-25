tests-events
testOnXhr
	self
		assert: (self jQuery ajax onXhr: (self javascript alert: 'create'))
		equals: self function , '.ajax({"xhr":function(){alert("create")}})'