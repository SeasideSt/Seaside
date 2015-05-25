tests
testLogging
	self
		assert: (self logger log: 'done')
		equals: 'console.log("done")'.
	self
		assert: (self logger log: 'done %s and %s' format: #( 'this' 'that' ))
		equals: 'console.log("done %s and %s","this","that")'