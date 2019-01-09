accessing
addServer: aServer
	(self serverNamed: aServer name) notNil 
		ifTrue: [^Error error: 'Server with that name already exists!'].

	self servers add: aServer