tests
testDefaultFiles
	| app |
	app := self defaultDispatcher handlerAt: 'files'.
	self assert: app class == WAFileHandler.
	self deny: app isDispatcher.
	self deny: app isApplication.
	self deny: app parent isNil.
	self assert: app name equals: 'files'.
	self assert: app url pathStringUnencoded equals: '/files'