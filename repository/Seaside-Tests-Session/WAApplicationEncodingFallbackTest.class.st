Class {
	#name : #WAApplicationEncodingFallbackTest,
	#superclass : #WARegistryTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #private }
WAApplicationEncodingFallbackTest >> newHandler [
	^ WAApplication new
		preferenceAt: #charSet put: 'utf-16';
		yourself
]

{ #category : #tests }
WAApplicationEncodingFallbackTest >> testContentType [
	self assert: handler contentType = ('text/html' seasideMimeType
		charset: 'utf-16';
		yourself)
]
