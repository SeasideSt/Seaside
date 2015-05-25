events-generated
onActivate: anObject
	"This event is triggered when using connected lists, every connected list on drag start receives it."

	self optionAt: 'activate' put: anObject asFunction