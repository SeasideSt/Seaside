tests
testGetAllDatabases
	self
		assertMethod: 'GET'
		selector: #getAllDatabases
		path: #('_all_dbs')
		arguments: #()