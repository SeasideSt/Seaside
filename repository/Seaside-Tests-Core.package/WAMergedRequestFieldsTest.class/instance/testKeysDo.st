tests-enumerating
testKeysDo
	| result |
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.
	two at: 'foo' put: 3.
	result := OrderedCollection new.
	merged keysDo: [ :each | result add: each ].
	self assert: result asArray = #('foo' 'bar' 'foo')