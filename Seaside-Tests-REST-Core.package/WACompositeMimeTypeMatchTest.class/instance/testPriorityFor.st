tests
testPriorityFor
	match := WACompositeMimeTypeMatch matches: (Array
		with: (WAMimeTypeMatch fromString: 'application/*')
		with: (WAMimeTypeMatch fromString: '*/*')).
	self assert: (match priorityFor: (WAMimeType fromString: 'application/json')) = 2