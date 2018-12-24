private
assertNotFound: aRequestContext
	self assert: aRequestContext response status = WAResponse statusFound.
	self assert: (aRequestContext response headerAt: 'Location') greaseString = '/1/2'