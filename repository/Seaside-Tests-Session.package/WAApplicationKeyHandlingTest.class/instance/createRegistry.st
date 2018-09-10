private
createRegistry
	^ WADispatcher new
		register: (WARedirectingApplication new
			sessionClass: WATestSession;
			cache: WAUnidirectionalCache new;
			yourself)
		at: self registryName