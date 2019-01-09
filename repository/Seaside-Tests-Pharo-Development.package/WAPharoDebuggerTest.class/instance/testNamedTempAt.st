tests
testNamedTempAt
	"This is a test for the Pharo debugger API
	http://code.google.com/p/seaside/issues/detail?id=689"
	| frames |
	frames := OrderedCollection new.
	[ self signalInterestingError ]
		on: WAError
		do: [ :error |
			| context |
			context := error signalerContext.
			[ context isNil ] whileFalse: [
				frames add: context.
				context := context sender ] ].
	frames do: [ :each |
		| tempNames |
		"fails on Sqeuak"
		self shouldnt: [ tempNames := each tempNames ] raise: Notification.
		1 to: tempNames size do: [ :i |
			"fails on Pharo"
			self shouldnt: [ each namedTempAt: i ] raise: Error ] ]