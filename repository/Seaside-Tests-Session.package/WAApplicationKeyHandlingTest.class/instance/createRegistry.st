private
createRegistry
	^ WADispatcher new
		register: (WAApplication new
			sessionClass: WATestSession;
			cache: WADictionaryCache new;
			yourself)
		at: self registryName