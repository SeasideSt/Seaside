private
basicStop
	process isNil
		ifFalse: [ process terminate ].
	process := nil