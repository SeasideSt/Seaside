tests-enumerating
testKeysAndValuesDo
	| keys values |
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.
	two at: 'foo' put: 3.
	keys := OrderedCollection new.
	values := OrderedCollection new.
	merged keysAndValuesDo: [ :key :value | 
		keys add: key.
		values add: value ].
	self assert: keys asArray = #('foo' 'bar' 'foo').
	self assert: values asArray = #(1 2 3)