events-generated
onResizeStop: anObject
	"This event is triggered after the dialog has been resized."

	self optionAt: 'resizeStop' put: anObject asFunction