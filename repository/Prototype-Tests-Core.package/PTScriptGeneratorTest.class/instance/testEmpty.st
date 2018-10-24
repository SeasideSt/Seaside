testing
testEmpty
	self
		assert: [ :html | ]
		gives: '<html><head><title></title></head><body></body></html>'