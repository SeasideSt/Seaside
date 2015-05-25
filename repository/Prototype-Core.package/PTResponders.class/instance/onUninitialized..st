events
onUninitialized: anObject
	"(Not guaranteed) Invoked when the XHR object was just created."

	self optionAt: 'onUninitialized' put: anObject asFunction