testing
testNestedEvaluation
	| k1 k2 val |
	self assert: (self mark: [ 
		2 * (self callcc: [ :c1 | 
			k1 := c1. 
			3 * (self callcc: [ :c2 |
				k2 := c2.
				4 ]) ]) ])
					= 24.
					
	self assert: (val := self mark: [
		k1 value: 5 ])
			= 10.
	self assert: (val := self mark: [
		k2 value: 5 ])
			= 30