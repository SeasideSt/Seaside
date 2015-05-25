events-generated
onDeactivate: anObject
	"This event is triggered when sorting was stopped, is propagated to all possible connected lists."

	self optionAt: 'deactivate' put: anObject asFunction