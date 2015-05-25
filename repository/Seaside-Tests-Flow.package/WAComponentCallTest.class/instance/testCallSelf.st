tests
testCallSelf

	| component callback |
	component := WAComponent new.
	callback :=  WAActionCallback new block: [ component call: component ]; yourself.
	self
		should: [ 
			[ callback evaluateWithArgument: nil ] on: WARenderNotification do: [ :e | nil ] ]
		raise: WAError