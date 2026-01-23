accessing
nextPut: aCharacter

	"Encoding for $< in Javascript strings. See https://html.spec.whatwg.org/multipage/scripting.html#restrictions-for-contents-of-script-elements"
	(aCharacter = $< and:[ self bufferIsEmpty ]) ifTrue:[
		"We encountered a $<, start buffering the characters."
		^ self bufferCharacter: aCharacter ].
	self bufferIsEmpty ifFalse:[
		"We are currently buffering characters (starting with a $<); check if we can flush the buffer and encode it if necesary."
		self bufferCharacter: aCharacter.
		^ self flushBufferWhenNeeded ].
	
	self privateNextPut: aCharacter