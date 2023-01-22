running
setUp
	super setUp.
	manager := WAServerManager new.
	adaptor := WATestServerAdaptor manager: manager.
	adaptor port: 12345.
	adaptor running.
	self assert: adaptor isRunning.
	self assert: (manager adaptors includes: adaptor)