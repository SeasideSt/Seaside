tests
testAllTests
	| app |
	app := self defaultDispatcher handlerAt: 'tests/functional'.
	self assert: app class == WAApplication.
	self assert: app isApplication.
	self deny: app isDispatcher.
	self deny: app parent isNil.
	self assert: app name = 'functional'.
	self assert: app url pathStringUnencoded = '/tests/functional'