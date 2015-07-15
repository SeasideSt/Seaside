tests
testIssue239
	| converter role url stream specialCharacters x y |
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
		WAUrlEncoder encode: char on: stream.
		stream nextPutAll: '=a'.
		WAUrlEncoder encode: char on: stream.
		stream nextPut: $c.
		char ~= specialCharacters last ifTrue: [  stream nextPut: $& ]].
	role params at: 'REQUEST_URI' put: stream contents.
	url := converter requestUrlFor: role.
	specialCharacters do: [:char |
		self assert: (x := url queryFields at: ('key', (String with: char))) = (y:= 'a', (String with: char), 'c') ]