tests
testLastId
	self
		assert: [ :html | self assert: html lastId isNil ]
		gives: ''.
	self
		assert: [ :html | html nextId. html text: html lastId; text: html lastId ]
		gives: 'id1id1'.
	self
		assert: [ :html | html anchor ensureId; callback: [ ]. self assert: html lastId = 'id1' ]
		gives: '<a id="id1" href="/?2"></a>'