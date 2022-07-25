private
loadHeader: strm
	| magic |
	magic := GRPlatform current nextUInt32: strm.
	magic = 16rDE120495 
		ifTrue: [ isLittleEndian := true ]
		ifFalse: [
			magic = 16r950412DE 
				ifTrue: [ isLittleEndian := false ]
				ifFalse: [ self error: 'invalid MO' ] ].
	revision := self nextInt32From: strm.
	nStrings := self nextInt32From: strm.
	originalTableOffset := self nextInt32From: strm.
	translatedTableOffset := self nextInt32From: strm.
