private
assert: aBlock rendersTo: aString
	| actual |
	actual := WASwagger2SpecificationCanvas builder render: aBlock.
	self assert: actual equals: aString