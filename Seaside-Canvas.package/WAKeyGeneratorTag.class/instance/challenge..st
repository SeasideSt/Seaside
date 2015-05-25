attributes
challenge: aString
	"Specifies the challenge string to be packaged with the public key for use in verification of the form submission. If no challenge string is provided, then it is encoded as an 'IA5STRING' of length zero. "
	self attributeAt: 'challenge' put: aString