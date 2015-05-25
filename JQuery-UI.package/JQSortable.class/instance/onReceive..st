events-generated
onReceive: anObject
	"This event is triggered when a connected sortable list has received an item from another list."

	self optionAt: 'receive' put: anObject asFunction