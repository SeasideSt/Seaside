class initialization
initialize
	TheWorldMenu registerOpenCommand: (Array
		with: 'Seaside Control Panel'
		with: (Array with: self with: #open)
		with: 'The Seaside Contorl Panel can be used to manage adaptors and request handlers')