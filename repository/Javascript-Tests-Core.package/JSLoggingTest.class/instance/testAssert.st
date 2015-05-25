tests
testAssert
	self 
		assert: (self logger assert: true)
		equals: 'console.assert(true)'.
	self
		assert: (self logger assertTrue: true)
		equals: 'console.assertTrue(true)'.
	self 
		assert: (self logger assertFalse: false)
		equals: 'console.assertFalse(false)'.
	self
		assert: (self logger assertNull: nil)
		equals: 'console.assertNull(null)'.
	self
		assert: (self logger assertNotNull: 1)
		equals: 'console.assertNotNull(1)'.
	self
		assert: (self logger assertUndefined: nil)
		equals: 'console.assertUndefined(null)'.
	self
		assert: (self logger assertNotUndefined: 1)
		equals: 'console.assertNotUndefined(1)'