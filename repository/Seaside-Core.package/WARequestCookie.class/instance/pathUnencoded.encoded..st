accessing
pathUnencoded: aFirstString encoded: aSecondString
	path := self sanitizePath: aFirstString.
	pathEncoded := self sanitizePath: aSecondString