events-generated
onOpen: anObject
	"This event is triggered when dialog is opened."

	self optionAt: 'open' put: anObject asFunction