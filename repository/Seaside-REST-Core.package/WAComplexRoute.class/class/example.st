examples
example
	^ self
		get: '/{3}/_all_docs?startkey={1}&limit={2}'
		selector: #getAllDocumentsStartingAt:limitedTo:inDatabase: