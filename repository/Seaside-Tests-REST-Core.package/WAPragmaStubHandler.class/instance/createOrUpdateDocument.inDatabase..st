public-documents
createOrUpdateDocument: documentId inDatabase: databaseName
	<put>
	<path: '/{databaseName}/{documentId}'>
	