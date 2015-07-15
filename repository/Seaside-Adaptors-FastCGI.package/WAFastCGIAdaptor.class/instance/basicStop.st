private
basicStop
	server isNil
		ifFalse: [ server stop ].
	server := nil