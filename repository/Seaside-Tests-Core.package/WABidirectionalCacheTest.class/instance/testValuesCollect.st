testing
testValuesCollect
	| values |
	cache at: 1 put: '1'.
	cache at: 2 put: '2'.
	
	values := cache valuesCollect: [ :each |
		each, each ].
	self assert: values class == cache class.
	self assert: values size = 2.
	self assert: ((values at: 1 ifAbsent: [ nil ]) = '11').
	self assert: ((values at: 2 ifAbsent: [ nil ]) = '22')