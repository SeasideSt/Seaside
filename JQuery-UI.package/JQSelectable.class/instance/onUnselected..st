events-generated
onUnselected: anObject
	"This event is triggered at the end of the select operation, on each element removed from the selection."

	self optionAt: 'unselected' put: anObject asFunction