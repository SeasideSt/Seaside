events
onBeforeUpdate: anObject
	"Called on each iteration of the effects rendering loop, before the redraw takes places."

	self options at: 'beforeUpdate' put: anObject asFunction