routes
getEntries

	<method: 'GET'>
	<path: 'entries'>
	<produces: 'application/json'>

	^self sampleData asJson