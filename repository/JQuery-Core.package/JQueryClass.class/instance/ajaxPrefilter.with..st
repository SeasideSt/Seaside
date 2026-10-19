ajax
ajaxPrefilter: aString with: anObject
	"Register a prefilter for the given dataType expression."

	self call: 'ajaxPrefilter' with: aString with: anObject