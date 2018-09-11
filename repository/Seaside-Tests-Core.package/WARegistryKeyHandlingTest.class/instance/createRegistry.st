private
createRegistry
	^ WADispatcher new
		register: (WARedirectingRegistry new
			cache: WABidirectionalCache new;
			yourself)
		at: self registryName