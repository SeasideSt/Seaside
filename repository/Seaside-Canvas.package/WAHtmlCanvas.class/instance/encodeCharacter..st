convenience
encodeCharacter: aCharacter 
	self html: '&#' , aCharacter greaseInteger greaseString , ';'