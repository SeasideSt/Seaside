tests
testReplaceFromToWithStartingAt
	| buffer replacement |
	replacement := #(1 2 3 4).
	1
		to: 5
		do: [ :index |
			buffer := ZnRingBuffer new: 5.
			buffer moveStartTo: index.
			buffer
				replaceFrom: 2
				to: 4
				with: replacement
				startingAt: 2.
				
			self assert: (buffer at: 1) isNil.
			self assert: (buffer at: 2) equals: 2.
			self assert: (buffer at: 3) equals: 3.
			self assert: (buffer at: 4) equals: 4.
			self assert: (buffer at: 5) isNil ]