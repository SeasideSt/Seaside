tests
testEncodedSupplementaryMultilingualPlaneUrl
	"The Supplementary Multilingual Plane (SMP: Plane 1, U+010000 - U+01FFFF)
	http://www.unicode.org/charts/PDF/U10140.pdf
	Ancient Greek Zero Sign"
	| zero |
	zero := (Character codePoint: 65930) greaseString.
	self 
		assert: zero
		urlEncodedGives: '%F0%90%86%8A'