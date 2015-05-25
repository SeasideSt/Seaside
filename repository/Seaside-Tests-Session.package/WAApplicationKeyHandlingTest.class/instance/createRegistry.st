private
createRegistry
	^ WADispatcher new
		register: (WAApplication new
			preferenceAt: #sessionClass put: WATestSession;
			yourself)
		at: self registryName