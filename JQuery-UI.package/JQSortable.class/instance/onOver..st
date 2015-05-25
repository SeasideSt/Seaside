events-generated
onOver: anObject
	"This event is triggered when a sortable item is moved into a connected list."

	self optionAt: 'over' put: anObject asFunction