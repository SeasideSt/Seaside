tests
testEncodedUnicode
	"this makes sure the encoder doesn't fall on the nose with unicode"
	| hiraA hiraO hiraAO ea |
	ea := String 
		with: (Character codePoint: 233)
		with: (Character codePoint: 228).
	self 
		assert: ea
		xmlEncodedGives: ea.
	hiraA := (Character codePoint: 12354) greaseString.	"HIRAGANA LETTER A"
	hiraO := (Character codePoint: 12362) greaseString.	"HIRAGANA LETTER O"
	hiraAO := hiraA , hiraO.
	self 
		assert: hiraA
		xmlEncodedGives: hiraA.
	self 
		assert: hiraO
		xmlEncodedGives: hiraO.
	self 
		assert: hiraAO
		xmlEncodedGives: hiraAO