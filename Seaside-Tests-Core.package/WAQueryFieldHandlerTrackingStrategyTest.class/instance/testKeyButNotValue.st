tests
testKeyButNotValue
	| context actual |
	context := self requestContext.
	context request uri addField: strategy keyField.
	actual := strategy keyFromContext: context.
	self assert: actual isNil