events
onLoading: anObject
	"(Not guaranteed) Triggered when the underlying XHR object is being setup, and its connection opened."

	self optionAt: 'onLoading' put: anObject asFunction