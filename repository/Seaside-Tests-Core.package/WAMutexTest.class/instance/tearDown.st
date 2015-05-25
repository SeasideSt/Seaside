running
tearDown
	super tearDown.
	process isNil ifFalse: [ GRPlatform current terminateProcess: process ].
	process2 isNil ifFalse: [ GRPlatform current terminateProcess: process2 ].
	"Clear instance variables so that GemStone does not attempt to persist a Semaphore"
	mutex := nil.
	process := nil.
	process2 := nil