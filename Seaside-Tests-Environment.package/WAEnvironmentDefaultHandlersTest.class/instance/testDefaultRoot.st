tests
testDefaultRoot
	| app |
	app := self defaultDispatcher.
	self assert: app class == WADispatcher.
	self assert: app isDispatcher.
	self assert: app isRoot.
	self deny: app isApplication.
	self assert: app parent isNil.
	self assert: app name = ''.
	self assert: app url pathStringUnencoded = '/'