private
assertOk: aRequestContext
	self assert: aRequestContext response status = WAResponse statusOk