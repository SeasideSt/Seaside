private
routes
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