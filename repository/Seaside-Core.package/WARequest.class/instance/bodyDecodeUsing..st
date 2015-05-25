accessing-body
bodyDecodeUsing: aCharSetName 
	"Answer the body decoded using the given character set name. Answer nil if there's no body."
	^ body isNil ifFalse: [ (GRCodec forEncoding: aCharSetName) decode: body ]