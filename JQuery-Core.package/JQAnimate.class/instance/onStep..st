events
onStep: anObject
	"A function to be executed on each animation step, executes for each element animated against."

	self optionAt: 'step' put: anObject asFunction