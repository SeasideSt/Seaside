tests-accessing
testAllAt
	one at: 'one' put: 1.
	one at: 'both' put: 1.
	two at: 'two' put: 2.
	two at: 'both' put: 2.
	
	self assert: (merged allAt: 'one') = #(1).
	self assert: (merged allAt: 'two') = #(2).
	self assert: (merged allAt: 'both') = #(1 2).
	self assert: (merged allAt: 'neither') = #()