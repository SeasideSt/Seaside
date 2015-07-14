private
createRegistry
	^ WADispatcher new
		register: (WARegistry new
			cache: WABidirectionalCache new;
			yourself)
		at: self registryName