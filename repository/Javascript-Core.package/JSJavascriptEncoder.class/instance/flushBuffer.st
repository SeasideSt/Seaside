private - encoding
flushBuffer

	self bufferIsEmpty ifTrue: [ ^ self ].
	buffer doWithIndex:[:char :index | 
		index = offset ifTrue:[ offset := 1. ^ self ].
		self privateNextPut: char ].
	offset := 1.