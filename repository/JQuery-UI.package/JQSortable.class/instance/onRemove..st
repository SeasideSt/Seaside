events-generated
onRemove: anObject
	"This event is triggered when a sortable item has been dragged out from the list and into another."

	self optionAt: 'remove' put: anObject asFunction