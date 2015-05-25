events-generated
onUnselecting: anObject
	"This event is triggered during the select operation, on each element removed from the selection."

	self optionAt: 'unselecting' put: anObject asFunction