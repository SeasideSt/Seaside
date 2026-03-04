public-documents
getAllDocuments: databaseName
	<get>
	<path: '/{databaseName}/_all_docs'>
	<optionalQueryParameters: 'sorted,filter'>
	