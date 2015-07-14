testing
testCopy
	| copy absent |
	cache at: 1 put: '1'.
	cache at: 2 put: '2'.
	copy := cache copy.
	
	copy remove: '2'.
	copy at: 1 put: '1a'.
	copy at: 3 put: '3'.
	
	"cache:
		1 -> '1'
		2 -> '2'
	copy:
		1 -> '1a'
		3 -> '3'
	"
	
	self assert: (cache at: 1 ifAbsent: [ self assert: false ]) = '1'.
	self assert: (cache at: 2 ifAbsent: [ self assert: false ]) = '2'.
	self assert: (cache keyAtValue: '1' ifAbsent: [ self assert: false ]) = 1.
	self assert: (cache keyAtValue: '2' ifAbsent: [ self assert: false ]) = 2.
	absent := false.
	cache at: 3 ifAbsent: [ absent := true ].
	self assert: absent.
	absent := false.
	cache keyAtValue: '1a' ifAbsent: [ absent := true ].
	self assert: absent.
	cache keyAtValue: '3' ifAbsent: [ absent := true ].
	self assert: absent.
	
	self assert: (copy at: 1 ifAbsent: [ self assert: false ]) = '1a'.
	self assert: (copy at: 3 ifAbsent: [ self assert: false ]) = '3'.
	self assert: (copy keyAtValue: '1a' ifAbsent: [ self assert: false ]) = 1.
	self assert: (copy keyAtValue: '3' ifAbsent: [ self assert: false ]) = 3.
	absent := false.
	copy at: 2 ifAbsent: [ absent := true ].
	self assert: absent.
	absent := false.
	copy keyAtValue: '1' ifAbsent: [ absent := true ].
	self assert: absent.
	copy keyAtValue: '2' ifAbsent: [ absent := true ].
	self assert: absent