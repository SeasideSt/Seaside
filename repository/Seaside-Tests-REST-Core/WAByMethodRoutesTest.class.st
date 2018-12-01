Class {
	#name : #WAByMethodRoutesTest,
	#superclass : #TestCase,
	#instVars : [
		'routes'
	],
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #private }
WAByMethodRoutesTest >> assertMethod: aMethodString selector: aSymbol path: aFirstCollectionOfStrings arguments: aSecondCollectionOfStrings [
	self
		assertMethod: aMethodString
		selector: aSymbol
		path: aFirstCollectionOfStrings
		parameters: Dictionary new
		arguments: aSecondCollectionOfStrings
]

{ #category : #private }
WAByMethodRoutesTest >> assertMethod: aMethodString selector: aSymbol path: aFirstCollectionOfStrings parameters: aDictionary arguments: aSecondCollectionOfStrings [
	| result stub requestUrl request context |
	requestUrl := WAUrl new
		addAllToPath: aFirstCollectionOfStrings;
		queryFields: aDictionary;
		yourself.
	request := WARequest
		method: aMethodString
		uri: requestUrl.
	context := WARequestContext request: request response: WAResponse new.
	result := routes routeForContext: context consume: true ifAbsent: [ self assert: false ].
	stub := WAByMethodRoutesStub new.
	result sendMessageTo: stub.
	self assert: stub selector = aSymbol.
	self assert: stub arguments = aSecondCollectionOfStrings.
	self assert: context consumer atEnd
]

{ #category : #private }
WAByMethodRoutesTest >> routes [
	^ OrderedCollection new
		"Meta"
		add: (WARoute get: #getInfo);
		add: (WARoute get: '/_all_dbs' selector: #getAllDatabases);
		add: (WARoute get: '/_config' selector: #getConfig);
		add: (WARoute get: '/_stats' selector: #getStats);
		add: (WARoute get: '/_uuids?count={1}' selector: #getUuids:);
		add: (WARoute post: '/_replicate' selector: #replicate);
		
		"Database"
		add: (WARoute post: '/{1}/_compact' selector: #compactDatabase:);
		add: (WARoute put: #createDatabase:);
		add: (WARoute delete: #deleteDatabase:);
		add: (WARoute get: #getDatabase:);
		
		"Documents"
		add: (WARoute get: '/{1}/_all_docs' selector: #getAllDocuments:);
		add: (WARoute get: '/{2}/{1}' selector: #getDocument:ofDatabase:);
		add: (WARoute post: #createNewDocumentInDatabase:);
		add: (WARoute put: '/{2}/{1}' selector: #createOrUpdateDocument:inDatabase:);
		add: (WARoute delete: '/{2}/{1}' selector: #deleteDocument:inDatabase:);
		add: (WARoute post: '/{1}/_bulk_docs' selector: #createBulkDocumentsInDatabase:);
		add: (WARoute post: '/{1}/_temp_view' selector: #queryDatabase:);
		add: (WARoute get: '/{3}/_design/{2}/_view/{1}' selector: #getView:inDesign:inDatabase:);
		yourself
]

{ #category : #running }
WAByMethodRoutesTest >> setUp [
	super setUp.
	routes := WAByMethodRoutes routes: self routes
]

{ #category : #tests }
WAByMethodRoutesTest >> testArgumentNamesOf [
	self assert: (GRPlatform current argumentNamesOf: (WAByMethodRoutesStub compiledMethodAt: #deleteDocument:inDatabase:)) asSet = #('aFirstString' 'aSecondString') asSet
]

{ #category : #tests }
WAByMethodRoutesTest >> testCompactDatabase [
	self
		assertMethod: 'POST'
		selector: #compactDatabase:
		path: #('credit_cards' '_compact')
		arguments: #('credit_cards')
]

{ #category : #tests }
WAByMethodRoutesTest >> testCreateBulkDocumentsInDatabase [
	self
		assertMethod: 'POST'
		selector: #createBulkDocumentsInDatabase:
		path: #('credit_cards' '_bulk_docs')
		arguments: #('credit_cards')
]

{ #category : #tests }
WAByMethodRoutesTest >> testCreateDatabase [
	self
		assertMethod: 'PUT'
		selector: #createDatabase:
		path: #('credit_cards')
		arguments: #('credit_cards')
]

{ #category : #tests }
WAByMethodRoutesTest >> testCreateNewDocumentInDatabase [
	self
		assertMethod: 'POST'
		selector: #createNewDocumentInDatabase:
		path: #('credit_cards')
		arguments: #('credit_cards')
]

{ #category : #tests }
WAByMethodRoutesTest >> testCreateOrUpdateDocumentinDatabase [
	self
		assertMethod: 'PUT'
		selector: #createOrUpdateDocument:inDatabase:
		path: #('credit_cards' '1111-2222-3333-4444')
		arguments: #('1111-2222-3333-4444' 'credit_cards')
]

{ #category : #tests }
WAByMethodRoutesTest >> testDeleteDatabase [
	self
		assertMethod: 'DELETE'
		selector: #deleteDatabase:
		path: #('credit_cards')
		arguments: #('credit_cards')
]

{ #category : #tests }
WAByMethodRoutesTest >> testDeleteDocumentInDatabase [
	self
		assertMethod: 'DELETE'
		selector: #deleteDocument:inDatabase:
		path: #('credit_cards' '1111-2222-3333-4444')
		arguments: #('1111-2222-3333-4444' 'credit_cards')
]

{ #category : #tests }
WAByMethodRoutesTest >> testGetAllDatabases [
	self
		assertMethod: 'GET'
		selector: #getAllDatabases
		path: #('_all_dbs')
		arguments: #()
]

{ #category : #tests }
WAByMethodRoutesTest >> testGetConfig [
	self
		assertMethod: 'GET'
		selector: #getConfig
		path: #('_config')
		arguments: #()
]

{ #category : #tests }
WAByMethodRoutesTest >> testGetDatabase [
	self
		assertMethod: 'GET'
		selector: #getDatabase:
		path: #('credit_cards')
		arguments: #('credit_cards')
]

{ #category : #tests }
WAByMethodRoutesTest >> testGetDocumentOfDatabase [
	self
		assertMethod: 'GET'
		selector: #getDocument:ofDatabase:
		path: #('credit_cards' '1111-2222-3333-4444')
		arguments: #('1111-2222-3333-4444' 'credit_cards')
]

{ #category : #tests }
WAByMethodRoutesTest >> testGetInfo [
	self
		assertMethod: 'GET'
		selector: #getInfo
		path: #()
		arguments: #()
]

{ #category : #tests }
WAByMethodRoutesTest >> testGetStats [
	self
		assertMethod: 'GET'
		selector: #getStats
		path: #('_stats')
		arguments: #()
]

{ #category : #tests }
WAByMethodRoutesTest >> testGetUuids [
	self
		assertMethod: 'GET'
		selector: #getUuids:
		path: #('_uuids')
		parameters: (Dictionary new
			at: 'count' put: '100';
			yourself)
		arguments: #('100')
]

{ #category : #tests }
WAByMethodRoutesTest >> testGetViewInDesignInDatabase [
	self
		assertMethod: 'GET'
		selector: #getView:inDesign:inDatabase:
		path: #('credit_cards' '_design' 'fraud' '_view' 'recent')
		arguments: #('recent' 'fraud' 'credit_cards')
]

{ #category : #tests }
WAByMethodRoutesTest >> testPathUnconsumedWhenNotFound [
	| requestUrl request context notFound |
	requestUrl := WAUrl new
		addAllToPath: #('I' 'can' 'not' 'be' 'found');
		yourself.
	request := WARequest
		method: 'GET'
		uri: requestUrl.
	context := WARequestContext request: request response: WAResponse new.
	notFound := false.
	routes routeForContext: context consume: true ifAbsent: [ notFound := true ].
	self assert: notFound.
	self deny: context consumer atEnd.
	self assert: context consumer upToEnd = #('I' 'can' 'not' 'be' 'found') asOrderedCollection
]

{ #category : #tests }
WAByMethodRoutesTest >> testQueryDatabase [
	self
		assertMethod: 'POST'
		selector: #queryDatabase:
		path: #('credit_cards' '_temp_view')
		arguments: #('credit_cards')
]

{ #category : #tests }
WAByMethodRoutesTest >> testReplicate [
	self
		assertMethod: 'POST'
		selector: #replicate
		path: #('_replicate')
		arguments: #()
]
