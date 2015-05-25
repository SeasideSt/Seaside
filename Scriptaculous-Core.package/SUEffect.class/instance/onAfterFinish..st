events
onAfterFinish: anObject
	"Called after the last redraw of the effect was made."

	self options at: 'afterFinish' put: anObject asFunction