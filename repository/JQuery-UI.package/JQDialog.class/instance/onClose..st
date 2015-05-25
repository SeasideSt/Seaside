events-generated
onClose: anObject
	"This event is triggered when the dialog is closed."

	self optionAt: 'close' put: anObject asFunction