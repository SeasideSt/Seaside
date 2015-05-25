events-generated
onDeactivate: anObject
	"This event is triggered any time an accepted draggable stops dragging."

	self optionAt: 'deactivate' put: anObject asFunction