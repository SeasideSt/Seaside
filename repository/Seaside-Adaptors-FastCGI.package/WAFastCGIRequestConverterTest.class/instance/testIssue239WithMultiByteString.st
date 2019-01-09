tests
testIssue239WithMultiByteString
	| converter role url stream specialCharacters utf8String urlStream urlEncoder x y |
	converter := WAFastCGIAdaptor new.
	converter codec: GRUtf8GemStoneCodec new.
	role := FSResponderRole new
		stdin: nil params: Dictionary new.
	"construct a fake url containing all of the special characters used in both query field keys and values"
	stream := WriteStream on: String new.
	stream nextPutAll: '/my/path?'.
	specialCharacters := #( $? $= $+ $& $# $/).
	specialCharacters do: [:char |
		stream nextPutAll: 'key'.
		WAGsUrlEncoder encode: char on: stream.
		stream nextPutAll: '=a'.
		WAGsUrlEncoder encode: char on: stream.
		stream nextPut: $c.
		stream nextPut: $& ].
	utf8String := #( 208 175 32 208 188 208 190 208 179 209 131 32 208 181 209 129 209 130 209 140 32 209 129 209 130 208 181 208 186 208 187 208 190 44 32 208 190 208 189 208 190 32 208 188 208 189 208 181 32 208 189 208 181 32 208 178 209 128 208 181 208 180 208 184 209 130 46) asByteArray asString.
	urlStream := WriteStream on: String new.
	urlEncoder := WAGsUrlEncoder on: urlStream.
	urlEncoder nextPutAll: utf8String.
	stream nextPutAll: 'key='; nextPutAll: urlStream contents.
	role params at: 'REQUEST_URI' put: stream contents.
	url := converter requestUrlFor: role.
	specialCharacters do: [:char |
		self assert: (x := url queryFields at: ('key', (String with: char))) = (y:= 'a', (String with: char), 'c') ].
	self assert: (x := (url queryFields at: 'key') encodeAsUTF8 asByteArray) = (y:= utf8String asByteArray)