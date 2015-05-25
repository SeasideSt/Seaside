events-generated
onSelecting: anObject
	"This event is triggered during the select operation, on each element added to the selection."

	self optionAt: 'selecting' put: anObject asFunction