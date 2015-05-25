tests
testPassenger
	self 
		assert: [ :html | html div passenger: self ]
		renders: '<div id="id1"></div>'.
	self 
		assert: [ :html | 
			html div passenger: self.
			html div passenger: self class ]
		renders: '<div id="id1"></div><div id="id2"></div>'