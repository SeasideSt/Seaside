tests
testCharacter
	self assert: (Character codePoint: 0) equals: '"\0"'.
	self assert: Character lf equals: '"\n"'.
	self assert: $a equals: '"a"'