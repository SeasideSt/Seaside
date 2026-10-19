tests-utilities
testDeferredGetErrorHook
	self
		assert: self jQuery deferredGetErrorHook
		equals: self function , '.Deferred.getErrorHook'