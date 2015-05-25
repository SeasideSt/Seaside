actions
debugAndResume: anException
	self open: anException.

	"If the user closes the debugger, the process is terminated and the stack unwound.
	There was previously an #ifCurtailed: block around the #open: call above to try to
	catch the process termination so we could display a nice error page but this also
	ended up being called when the user restarted a context in the debugger.
	
	If they Proceed in the debugger, behaviour is platform-dependent. Currently, VW
	should resume the signaling context, so this method will not continue past the call
	to #open:. Squeak currently resumes the context that opened the Debugger, which
	results in the call to #open: returning."

	^ self resume: anException