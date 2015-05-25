evaluation
evaluateWithFieldValues: anOrderedCollection
	self evaluateWithArgument: ((anOrderedCollection
		collect: [ :each | self valueForField: each])
		reject: [ :each | each isNil ])