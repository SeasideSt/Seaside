tests
testCanStartWithUnavailablePort
	| adaptor1 |
	adaptor1 := WATestServerAdaptor manager: manager.
	adaptor1 port: adaptor port.
	adaptor1 starting.
	self deny: (manager canStart: adaptor1).
	adaptor1 running.
	self deny: (manager canStart: adaptor1).
	adaptor1 stopping.
	self deny: (manager canStart: adaptor1).
	adaptor1 stopped.
	self deny: (manager canStart: adaptor1)