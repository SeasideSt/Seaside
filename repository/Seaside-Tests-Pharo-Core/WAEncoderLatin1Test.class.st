Class {
	#name : #WAEncoderLatin1Test,
	#superclass : #WAEncoderTest,
	#category : 'Seaside-Tests-Pharo-Core'
}

{ #category : #configuration }
WAEncoderLatin1Test >> createCodec [
	^ GRCodec forEncoding: 'iso-8859-1'
]

{ #category : #tests }
WAEncoderLatin1Test >> testEncodedLatin1Url [
	self
		assert: (String
			with: Character space
			with: (Character codePoint: 233)
			with: (Character codePoint: 228))
		urlEncodedGives: '%20%E9%E4'
]

{ #category : #tests }
WAEncoderLatin1Test >> testEncodedLatin1Xml [
	| string |
	string := String
		with: Character space
		with: (Character codePoint: 233)
		with: (Character codePoint: 228).
	self
		assert: string
		xmlEncodedGives: string
]
