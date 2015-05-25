events
onComplete: anObject
	"A function to be executed whenever the animation completes, executes once for each element animated against."
	
	self optionAt: 'complete' put: anObject asFunction