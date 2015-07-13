private
createRegistry
	^ WADispatcher new
		register: (WARegistry new
			cache: WADictionaryCache new;
			yourself)
		at: self registryName