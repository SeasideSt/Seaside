ansi-exception-selector
handles: anException 
	"You should probably override #exceptionSelector instead of this method.
	If you do need to override this method, make sure to override #, as well"
	^ self exceptionSelector handles: anException