private
checkBoundsFor: anInteger
	(anInteger < 1 or: [
		anInteger > self size ]) ifFalse: [ ^ self ].
	
	ZnRingBufferIllegalAccess signal