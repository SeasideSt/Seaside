initialization
initialize
	super initialize.
	site := WAPluggableSite
		named: (WAKeyGenerator current keyOfLength: 32)
		on: self.
	site ip: '*'.
	site host: '*'