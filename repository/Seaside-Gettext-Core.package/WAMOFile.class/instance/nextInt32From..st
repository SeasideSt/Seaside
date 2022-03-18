private
nextInt32From: strm
	^isLittleEndian 
			ifTrue: [^strm nextLittleEndianNumber: 4]
			ifFalse: [^strm nextInt32]