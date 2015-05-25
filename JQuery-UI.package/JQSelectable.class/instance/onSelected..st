events-generated
onSelected: anObject
	"This event is triggered at the end of the select operation, on each element added to the selection."

	self optionAt: 'selected' put: anObject asFunction