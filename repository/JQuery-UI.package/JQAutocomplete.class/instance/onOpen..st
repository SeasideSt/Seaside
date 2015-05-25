events-generated
onOpen: anObject
	"Triggered when the suggestion menu is opened."

	self optionAt: 'open' put: anObject asFunction