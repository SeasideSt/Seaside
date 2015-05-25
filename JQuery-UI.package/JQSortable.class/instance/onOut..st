events-generated
onOut: anObject
	"This event is triggered when a sortable item is moved away from a connected list."

	self optionAt: 'out' put: anObject asFunction