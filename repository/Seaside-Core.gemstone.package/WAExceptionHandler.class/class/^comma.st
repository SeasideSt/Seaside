ansi-exception-selector
, anException 
	"Create an exception set that includes all the exceptions we handle and the
	one passed as a parameter."
	^ self exceptionSelector, anException