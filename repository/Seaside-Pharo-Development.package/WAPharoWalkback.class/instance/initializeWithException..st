initialization
initializeWithException: anException
	| context |
	super initializeWithException: anException.
	context := anException signalerContext.
	frames := OrderedCollection new.
	[ context isNil ] whileFalse: [
		frames add: context.
		context := context sender ]