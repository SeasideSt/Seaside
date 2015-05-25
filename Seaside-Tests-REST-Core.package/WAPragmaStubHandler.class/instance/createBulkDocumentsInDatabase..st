public-documents
createBulkDocumentsInDatabase: databaseName
	<post>
	<path: '/{databaseName}/_bulk_docs'>
	