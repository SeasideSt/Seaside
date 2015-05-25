events-generated
onBeforeClose: anObject
	"This event is triggered when a dialog attempts to close. If the beforeClose event handler (callback function) returns false, the close will be prevented."

	self optionAt: 'beforeClose' put: anObject asFunction