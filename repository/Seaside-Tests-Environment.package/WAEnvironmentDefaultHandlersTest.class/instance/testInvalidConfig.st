tests
testInvalidConfig
	| app |
	app := self defaultDispatcher handlerAt: 'examplesxyz/counter' ifAbsent: [ nil ].
	self assert: app isNil.
	app := self defaultDispatcher handlerAt: 'examples/counterxyz' ifAbsent: [ nil ].
	self assert: app isNil