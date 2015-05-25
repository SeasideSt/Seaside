events
onAfterUpdate: anObject
	"Called on each iteration of the effects rendering loop, after the redraw takes places."

	self options at: 'afterUpdate' put: anObject asFunction