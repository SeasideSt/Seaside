tests
testCanStop

	adaptor starting.
	self assert: (manager canStop: adaptor).
	adaptor running.
	self assert: (manager canStop: adaptor).
	adaptor stopping.
	self assert: (manager canStop: adaptor).
	adaptor stopped.
	self deny: (manager canStop: adaptor)