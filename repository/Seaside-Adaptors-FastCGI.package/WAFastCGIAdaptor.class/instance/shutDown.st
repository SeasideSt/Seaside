private
shutDown
	server isNil
		ifFalse: [ server stop ]