evaluation
evaluateWithFieldValues: anOrderedCollection
	self evaluateWithArgument: (self valueForField: (anOrderedCollection at: 1 ifAbsent: [ nil ]))