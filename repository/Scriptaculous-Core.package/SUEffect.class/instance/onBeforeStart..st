events
onBeforeStart: anObject
	"Called before the main effects rendering loop is started."

	self options at: 'beforeStart' put: anObject asFunction