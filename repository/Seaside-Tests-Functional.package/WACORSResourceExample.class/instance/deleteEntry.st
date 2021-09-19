routes
deleteEntry

	<method: 'DELETE'>
	<path: 'entries'>
	<produces: 'application/json'>
	^ self sampleData removeFirst asJson