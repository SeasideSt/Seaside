private
createRegistry
	^ WADispatcher new
		register: (WAApplication new
			sessionClass: WATestSession;
			cache: WAUnidirectionalCache new;
			yourself)
		at: self registryName