private
bufferCharacter: aCharacter

	buffer at: offset put: aCharacter.
	offset := offset + 1.