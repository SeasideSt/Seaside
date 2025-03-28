testing
testStore
	| generator |
	generator := WAPrecomputedKeyGenerator keys: #(1 2 3).
	WAKeyGenerator
		use: generator
		during: [
			self assert: (cache store: 'key1') equals: 1.
			self assert: (cache store: 'key2') equals: 2.
			self assert: (cache store: 'key3') equals: 3 ]