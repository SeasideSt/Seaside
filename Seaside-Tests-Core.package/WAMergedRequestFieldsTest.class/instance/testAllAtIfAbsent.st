tests-accessing
testAllAtIfAbsent
	one at: 'one' put: 1.
	one at: 'both' put: 1.
	two at: 'two' put: 2.
	two at: 'both' put: 2.
	
	self assert: (merged allAt: 'one' ifAbsent: [ 'absent' ]) = #(1).
	self assert: (merged allAt: 'two' ifAbsent: [ 'absent' ]) = #(2).
	self assert: (merged allAt: 'both' ifAbsent: [ 'absent' ]) = #(1 2).
	self assert: (merged allAt: 'neither' ifAbsent: [ 'absent' ]) = 'absent'
