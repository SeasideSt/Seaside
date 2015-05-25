private
basicDisconnect
	response ifNil: [ ^ self ].
	response destroy.
	response := nil