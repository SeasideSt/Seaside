actions
handleBreakpoint: aBreakpoint
	"snap off continuation and then resume"
	
	self saveExceptionContinuation: aBreakpoint.
	aBreakpoint resume