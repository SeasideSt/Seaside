Class {
	#name : #WAEncoderUnicodeTest,
	#superclass : #WAEncoderTest,
	#category : 'Seaside-Tests-Squeak-Core'
}

{ #category : #configuration }
WAEncoderUnicodeTest >> createCodec [
	^ GRCodec forEncoding: 'utf-8'
]

{ #category : #tests }
WAEncoderUnicodeTest >> testEncodedLatin1Url [
	self
		assert: (String
			with: Character space
			with: (Character codePoint: 233)
			with: (Character codePoint: 228))
		urlEncodedGives: '%20%C3%A9%C3%A4'
]

{ #category : #tests }
WAEncoderUnicodeTest >> testEncodedSupplementaryMultilingualPlane [
	"The Supplementary Multilingual Plane (SMP: Plane 1, U+010000 - U+01FFFF)
	http://www.unicode.org/charts/PDF/U10140.pdf
	Ancient Greek Zero Sign"
	| zero |
	zero := (Character codePoint: 65930) greaseString.
	self 
		assert: zero
		xmlEncodedGives: zero
]

{ #category : #tests }
WAEncoderUnicodeTest >> testEncodedSupplementaryMultilingualPlaneUrl [
	"The Supplementary Multilingual Plane (SMP: Plane 1, U+010000 - U+01FFFF)
	http://www.unicode.org/charts/PDF/U10140.pdf
	Ancient Greek Zero Sign"
	| zero |
	zero := (Character codePoint: 65930) greaseString.
	self 
		assert: zero
		urlEncodedGives: '%F0%90%86%8A'
]

{ #category : #tests }
WAEncoderUnicodeTest >> testEncodedUnicode [
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
]

{ #category : #tests }
WAEncoderUnicodeTest >> testEncodedUnicodeUrl [
	"this makes sure the encoder doesn't fall on the nose with unicode"
	| hiraA hiraO hiraAO ea |
	ea := String 
		with: (Character codePoint: 233)
		with: (Character codePoint: 228).
	self 
		assert: ea
		urlEncodedGives: '%C3%A9%C3%A4'.
	hiraA := (Character codePoint: 12354) greaseString.	"HIRAGANA LETTER A"
	hiraO := (Character codePoint: 12362) greaseString.	"HIRAGANA LETTER O"
	hiraAO := hiraA , hiraO.
	self 
		assert: hiraA
		urlEncodedGives: '%E3%81%82'.
	self 
		assert: hiraO
		urlEncodedGives: '%E3%81%8A'.
	self 
		assert: hiraAO
		urlEncodedGives: '%E3%81%82' , '%E3%81%8A'
]
