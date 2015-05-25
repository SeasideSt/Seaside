tests
testSearchContextsCaching
	"Search contexts should be cached after accessing them for the first time. Also the cache should be empty after clearSearchContexts."
	| root user |
	root := self basicSystemConfiguration.
	user := WAUserConfiguration new
		addParent: root;
		yourself.
	
	self assert: (user retrieveSearchContext: #a default: 'testingSearchContextsCache') = 'testingSearchContextsCache'.
	user at: #a.
	self assert: (user retrieveSearchContext: #a default: 'testingSearchContextsCache') attribute default = #default .
	user clearSearchContexts.
	self assert: (user retrieveSearchContext: #a default: 'testingSearchContextsCache') = 'testingSearchContextsCache'