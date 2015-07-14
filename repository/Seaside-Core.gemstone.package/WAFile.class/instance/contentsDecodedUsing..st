accessing
contentsDecodedUsing: aCharSetName
	"Answer the contents decoded using the given character set name."
	^ (GRCodec forEncoding: aCharSetName) decode: self rawContents