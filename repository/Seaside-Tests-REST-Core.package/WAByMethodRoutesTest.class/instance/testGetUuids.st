tests
testGetUuids
	self
		assertMethod: 'GET'
		selector: #getUuids:
		path: #('_uuids')
		parameters: (Dictionary new
			at: 'count' put: '100';
			yourself)
		arguments: #('100')