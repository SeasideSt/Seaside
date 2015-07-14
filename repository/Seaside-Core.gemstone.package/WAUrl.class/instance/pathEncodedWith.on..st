converting
pathEncodedWith: aCodec on: aStream
	| document |
	document := WAUnescapedDocument 
		on: aStream
		codec: aCodec.
	self encodePathOn: document