events-generated
onUpdate: anObject
	"This event is triggered when the user stopped sorting and the DOM position has changed."

	self optionAt: 'update' put: anObject asFunction