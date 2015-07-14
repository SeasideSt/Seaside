printing
printOn: aStream 
	| document codec |
	codec := [ self requestContext codec ] 
		on: WARequestContextNotFound
		do: [ :e | GRNullCodec new ].
	document := WAUnescapedDocument 
		on: aStream
		codec: codec.
	self encodeOn: document