events-generated
onLoad: anObject
	"This event is triggered after the content of a remote tab has been loaded."

	self optionAt: 'load' put: anObject asFunction