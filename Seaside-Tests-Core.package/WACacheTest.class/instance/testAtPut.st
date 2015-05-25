tests
testAtPut
	"test cache is empty"
	self assert: (cache at: 'key' ifAbsent: [ 0 ]) = 0.
	self assert: (cache keyAtValue: 'value' ifAbsent: [ 0 ]) = 0.
	
	"put"
	cache at: 'key' put: 'value'.
	
	"tests it's there"
	self assert: (cache at: 'key' ifAbsent: [ 0 ]) = 'value'.
	self assert: (cache keyAtValue: 'value' ifAbsent: [ 0 ]) = 'key'