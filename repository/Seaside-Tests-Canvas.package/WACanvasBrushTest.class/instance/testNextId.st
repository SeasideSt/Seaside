tests
testNextId
	self
		assert: [ :html | html div id: html nextId ]
		gives: '<div id="id1"></div>'.
	self
		assert: [ :html | html div id: 'foo'; id: html nextId ]
		gives: '<div id="id1"></div>'