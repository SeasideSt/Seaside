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
		"fails on Squeak"
		self shouldnt: [ tempNames := each tempNames ] raise: Notification.
		tempNames do: [ :name |
			"fails on Pharo"
			self shouldnt: [ each tempNamed: name ] raise: Error ] ]