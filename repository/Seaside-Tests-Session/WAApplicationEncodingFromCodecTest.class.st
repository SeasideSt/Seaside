Class {
	#name : #WAApplicationEncodingFromCodecTest,
	#superclass : #WARegistryTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #configuration }
WAApplicationEncodingFromCodecTest >> createCodec [
	^ GRCodec forEncoding: 'iso-8859-1'
]

{ #category : #private }
WAApplicationEncodingFromCodecTest >> newHandler [
	^ WAApplication new
		preferenceAt: #charSet put: 'utf-16';
		yourself
]

{ #category : #tests }
WAApplicationEncodingFromCodecTest >> testContentType [
	self assert: handler contentType = ('text/html' seasideMimeType
		charset: 'iso-8859-1';
		yourself)
]
