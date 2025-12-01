private
writeCharacterIfNotFirst: aCharacter
	first ifFalse: [
		self document nextPut: aCharacter ]