public-documents
updateDocument: documentId inDatabase: databaseName
	<patch>
	<path: '/{databaseName}/{documentId}'>
	