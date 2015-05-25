private
createRegistry
	^ WADispatcher new
		register: WARegistry new
		at: self registryName