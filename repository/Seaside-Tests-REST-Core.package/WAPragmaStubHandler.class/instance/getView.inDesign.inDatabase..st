public-documents
getView: viewName inDesign: designName inDatabase: databaseName
	<get>
	<path: '/{databaseName}/_design/{designName}/_view/{viewName}'>
	