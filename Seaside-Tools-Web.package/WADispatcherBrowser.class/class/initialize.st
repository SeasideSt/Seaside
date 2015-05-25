initialization
initialize
	(WAAdmin register: self asApplicationAt: 'browse') 
		addLibrary: WAToolFiles.
	WAAdmin defaultDispatcher defaultName: 'browse'