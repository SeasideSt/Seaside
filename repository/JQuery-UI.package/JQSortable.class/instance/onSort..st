events-generated
onSort: anObject
	"This event is triggered during sorting."

	self optionAt: 'sort' put: anObject asFunction