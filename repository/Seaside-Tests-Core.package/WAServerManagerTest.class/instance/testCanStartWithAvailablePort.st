tests
testCanStartWithAvailablePort
	| adaptor1 |
	adaptor starting.
	self deny: (manager canStart: adaptor).
	adaptor running.
	self deny: (manager canStart: adaptor).
	adaptor stopping.
	self deny: (manager canStart: adaptor).
	adaptor stopped.
	self assert: (manager canStart: adaptor).
	
	adaptor1 := WATestServerAdaptor manager: manager.
	adaptor1 port: adaptor port.
	adaptor1 stopped.
	self assert: (manager canStart: adaptor1)
	