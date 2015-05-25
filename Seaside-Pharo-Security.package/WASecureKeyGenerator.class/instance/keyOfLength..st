public
keyOfLength: anInteger
	^ mutex critical: [
		generator := self class generator.
		^ super keyOfLength: anInteger ]