private
basicStop
	service isNil
		ifFalse: [ service unregister; waitForStop ].
	service := nil