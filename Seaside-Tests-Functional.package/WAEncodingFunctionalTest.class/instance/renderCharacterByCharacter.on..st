rendering
renderCharacterByCharacter: aString on: html
	"Display aString character by character, but wrap each character into a span so it ends up individually in the output stream. If the codec does not convert to the internal encoding of Smalltalk the result is broken. Either choose an appropriate codec or be aware of the concequences."
	
	self requestContext codec name = '(none)'
	"Character by character rendering will fail for the NullCoded in case of multi byte characters. Don't test it."
		ifTrue: [ ^ self ].
	aString 	do: [ :each | html span: each ]