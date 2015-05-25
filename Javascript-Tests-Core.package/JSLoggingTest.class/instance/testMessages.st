tests
testMessages
	self
		assert: (self logger debug: 3)
		equals: 'console.debug(3)'.
	self
		assert: (self logger info: 'eye m here 2')
		equals: 'console.info("eye m here 2")'.
	self
		assert: (self logger warn: 'don"t 4get ur grlfrnd')
		equals: 'console.warn("don\"t 4get ur grlfrnd")'.
	self
		assert: (self logger error: 'gone gone gone')
		equals: 'console.error("gone gone gone")'