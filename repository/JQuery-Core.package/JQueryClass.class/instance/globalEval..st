utilities
globalEval: aString
	"Execute JavaScript code globally."

	self call: 'globalEval' with: aString