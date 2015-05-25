tests-enumerating
testDo
	| result |
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.
	two at: 'foo' put: 3.
	result := OrderedCollection new.
	merged do: [ :each | result add: each ].
	self assert: result asArray = #(1 2 3)