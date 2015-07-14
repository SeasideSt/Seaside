initialization
initializeWithContext: aGsContext
	| context |
	context := aGsContext.
	frames := OrderedCollection new.
	[ context isNil ] whileFalse: [
		frames add: context.
		context := context sender ].
	limit := 5 min: frames size