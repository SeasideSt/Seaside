tests-tools
testIsJavascript
	self deny: 123 isJavascript.
	self assert: self mock isJavascript.
	self assert: JSCreate new isJavascript