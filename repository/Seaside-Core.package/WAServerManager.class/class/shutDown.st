system startup
shutDown
	self default adaptors do: [ :each | each shutDown ]