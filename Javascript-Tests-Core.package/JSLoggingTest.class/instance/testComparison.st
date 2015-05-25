tests
testComparison
	self
		assert: (self logger assert: 1 equals: 1)
		equals: 'console.assertEquals(1,1)'.
	self
		assert: (self logger assert: 1 notEquals: 2)
		equals: 'console.assertNotEquals(1,2)'.
	self
		assert: (self logger assert: 1 greater: 2)
		equals: 'console.assertGreater(1,2)'.
	self
		assert: (self logger assert: 2 notGreater: 1)
		equals: 'console.assertNotGreater(2,1)'.
	self
		assert: (self logger assert: 2 less: 1)
		equals: 'console.assertLess(2,1)'.
	self
		assert: (self logger assert: 1 notLess: 2)
		equals: 'console.assertNotLess(1,2)'