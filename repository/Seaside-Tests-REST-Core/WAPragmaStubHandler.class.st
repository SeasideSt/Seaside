Class {
	#name : #WAPragmaStubHandler,
	#superclass : #WARestfulHandler,
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #'public-database' }
WAPragmaStubHandler >> compactDatabase: databaseName [
	<post>
	<path: '/{databaseName}/_compact'>
	
]

{ #category : #'public-documents' }
WAPragmaStubHandler >> createBulkDocumentsInDatabase: databaseName [
	<post>
	<path: '/{databaseName}/_bulk_docs'>
	
]

{ #category : #'public-database' }
WAPragmaStubHandler >> createDatabase: databaseName [
	<put>
	
]

{ #category : #'public-documents' }
WAPragmaStubHandler >> createNewDocumentInDatabase: databaseName [
	<post>
	
]

{ #category : #'public-documents' }
WAPragmaStubHandler >> createOrUpdateDocument: documentId inDatabase: databaseName [
	<put>
	<path: '/{databaseName}/{documentId}'>
	
]

{ #category : #'public-database' }
WAPragmaStubHandler >> deleteDatabase: databaseName [
	<delete>
	
]

{ #category : #'public-documents' }
WAPragmaStubHandler >> deleteDocument: documentId inDatabase: databaseName [
	<delete>
	<path: '/{databaseName}/{documentId}'>
	
]

{ #category : #'public-meta' }
WAPragmaStubHandler >> getAllDatabases [
	<get>
	<path: '/_all_dbs'>
	
]

{ #category : #'public-documents' }
WAPragmaStubHandler >> getAllDocuments: databaseName [
	<get>
	<path: '/{databaseName}/_all_docs'>
	
]

{ #category : #'public-meta' }
WAPragmaStubHandler >> getConfig [
	<get>
	<path: '/_config'>
	
]

{ #category : #'public-database' }
WAPragmaStubHandler >> getDatabase: databaseName [
	<get>
	
]

{ #category : #'public-documents' }
WAPragmaStubHandler >> getDocument: documentId ofDatabase: databaseName [
	<get>
	<path: '/{databaseName}/{documentId}'>
	
]

{ #category : #'public-meta' }
WAPragmaStubHandler >> getInfo [
	<get>
	
]

{ #category : #'public-meta' }
WAPragmaStubHandler >> getStats [
	<get>
	<path: '/_stats'>
	
]

{ #category : #'public-meta' }
WAPragmaStubHandler >> getUuids: numberOfUuids [
	<get>
	<path: '/_uuids?count={numberOfUuids}'>
	
]

{ #category : #'public-documents' }
WAPragmaStubHandler >> getView: viewName inDesign: designName inDatabase: databaseName [
	<get>
	<path: '/{databaseName}/_design/{designName}/_view/{viewName}'>
	
]

{ #category : #'public-database' }
WAPragmaStubHandler >> options [
	<options>
]

{ #category : #'public-documents' }
WAPragmaStubHandler >> queryDatabase: databaseName [
	<post>
	<path: '/{databaseName}/_temp_view'>
	
]

{ #category : #'public-meta' }
WAPragmaStubHandler >> replicate [
	<post>
	<path: '/_replicate'>
	
]

{ #category : #'public-documents' }
WAPragmaStubHandler >> updateDocument: documentId inDatabase: databaseName [
	<patch>
	<path: '/{databaseName}/{documentId}'>
	
]
