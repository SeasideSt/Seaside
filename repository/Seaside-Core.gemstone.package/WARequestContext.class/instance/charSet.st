accessing
charSet
	"Answer the character set to be used for the response.
	First try to take the one from the codec.
	If it is a NullCodec take the one from the handler.
	If there's no handler answer nil."
	| codecName handler |
	codecName := self codec name.
	codecName = GRNullCodec codecName
		ifFalse: [ ^ codecName ].
	handler := self handler.
	self handler isNil
		ifFalse: [ ^ handler charSet ].
	^ nil