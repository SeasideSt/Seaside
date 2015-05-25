private
writeBodyOn: stream
	self body isNil
		ifFalse: [ stream nextPutAll: self body greaseString ]