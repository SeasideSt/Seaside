tests
testSelector
	| selector |
	selector := self ptSelector add: '*'.
	self assert: selector equals: '$$("*")'.

	selector := self ptSelector add: 'div.zork'; add: 'p#zork'.
	self assert: selector equals: '$$("div.zork","p#zork")'.

	self
		assertEnumerable: [ self ptSelector add: 'p>a' ]
		prefix: '$$("p>a")'