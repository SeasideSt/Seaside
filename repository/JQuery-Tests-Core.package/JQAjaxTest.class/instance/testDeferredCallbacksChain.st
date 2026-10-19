tests-events
testDeferredCallbacksChain
	self
		assert: ((self jQuery ajax)
			done: (self javascript alert: 'ok');
			fail: (self javascript alert: 'no');
			always: (self javascript alert: 'end'))
		equals: self function, '.ajax().done(function(){alert("ok")}).fail(function(){alert("no")}).always(function(){alert("end")})'