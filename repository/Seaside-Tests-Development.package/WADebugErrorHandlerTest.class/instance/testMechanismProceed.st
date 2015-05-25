tests
testMechanismProceed
	"Test if things behave as expected when simulating a Debugger being proceeded
	(in other words, the process being terminated)."

	self
		simulateWithDebugBlock: [ nil ]
		progress: #(#a #c #d #e #b)
		result: #resumed