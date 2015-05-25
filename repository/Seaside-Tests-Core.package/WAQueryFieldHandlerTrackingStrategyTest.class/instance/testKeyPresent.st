tests
testKeyPresent
	| context actual |
	context := self requestContext.
	context request uri addField: strategy keyField value: '4e232e46-003d2-04324-d3ac8fa8'.
	actual := strategy keyFromContext: context.
	self assert: actual = '4e232e46-003d2-04324-d3ac8fa8'