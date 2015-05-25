options
transition: anObject
	"Sets a function that modifies the current point of the animation, which is between 0 and 1. Following transitions are supplied: Effect.Transitions.sinoidal (default), Effect.Transitions.linear, Effect.Transitions.reverse, Effect.Transitions.wobble and Effect.Transitions.flicker."

	self optionAt: 'transition' put: anObject asFunction