public-documents
deleteDocument: documentId inDatabase: databaseName
	<delete>
	<path: '/{databaseName}/{documentId}'>
	