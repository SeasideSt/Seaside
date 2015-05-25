system startup
startUp
	self default adaptors do: [ :each | each startUp ]