events-generated
onResizeStart: anObject
	"This event is triggered at the beginning of the dialog being resized."

	self optionAt: 'resizeStart' put: anObject asFunction