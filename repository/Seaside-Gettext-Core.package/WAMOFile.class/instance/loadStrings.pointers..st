private
loadStrings: strm pointers: tupple
	| offsetTable lenTable strings encodedStream |
	encodedStream := (GRCodec forEncoding: #utf8) decoderFor: strm.
	offsetTable := tupple first.
	lenTable := tupple second.
	strings := Array new: nStrings.
	1 to: nStrings do: [ :index | 
		| rawStr start byteLength endPos |
		start := offsetTable at: index.
		byteLength := lenTable at: index.
		endPos := start + byteLength.
		rawStr :=  (String new: byteLength) writeStream.
		encodedStream position: start.
		[ encodedStream position < endPos ] whileTrue: [ rawStr nextPut: encodedStream next ].
		strings at: index put: rawStr contents ].
	^ strings