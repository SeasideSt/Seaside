private
nextPutAllFast: aByteString
	| lastIndex nextIndex |
	"Encoding of $< in Javascript inside html requires to consider more than a single character.
	Therefore, we cannot use the superclass implementation and can only directly pass the string to the stream if no characters need to be encoded.
	See https://html.spec.whatwg.org/multipage/scripting.html#restrictions-for-contents-of-script-elements"
	lastIndex := 1.
	nextIndex := ByteString findFirstInString: aByteString inSet: table startingAt: lastIndex.
	nextIndex = 0 ifTrue: [ ^ stream nextPutAll: aByteString ].
	delegate nextPutAll: aByteString