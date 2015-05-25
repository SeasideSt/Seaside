tests
testMechanismAbort
	"Test if things behave as expected when simulating a Debugger being closed
	(in other words, the process being terminated)."

	self
		simulateWithDebugBlock: [ Processor activeProcess terminate ]
		progress: #(#a #c #d)
		result: nil