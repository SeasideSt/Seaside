Class {
	#name : #WAEncoderTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-Core-Document'
}

{ #category : #testing }
WAEncoderTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #private }
WAEncoderTest >> assert: aString urlEncodedGives: anEncodedString [
	| actual |
	actual := String streamContents: [ :stream |
		(GRPlatform current urlEncoderOn: stream codec: self requestContext codec) nextPutAll: aString ].
	self assert: actual = anEncodedString
]

{ #category : #private }
WAEncoderTest >> assert: aString xmlEncodedGives: anEncodedString [
	| actual |
	actual := String streamContents: [ :stream |
		(GRPlatform current xmlEncoderOn: stream) nextPutAll: aString ].
	self assert: actual = anEncodedString
]

{ #category : #tests }
WAEncoderTest >> testEncodedUrl [
	self assert: 'Seaside Aubergines' urlEncodedGives: 'Seaside%20Aubergines'.
	self assert: 'www.seaside.st' urlEncodedGives: 'www.seaside.st'.
	self assert: '~seaside-info_' urlEncodedGives: '~seaside-info_'.
	self assert: 'http://www.seaside.st?foo=1&bar=2' urlEncodedGives: 'http%3A%2F%2Fwww.seaside.st%3Ffoo%3D1%26bar%3D2'.
	self assert: 'a%' urlEncodedGives: 'a%25'.
	self assert: (String with: Character cr) urlEncodedGives: '%0D'
]

{ #category : #tests }
WAEncoderTest >> testEncodedXml [
	self assert: 'Seaside' xmlEncodedGives: 'Seaside'.
	self assert: '<div id="&amp;">' xmlEncodedGives: '&lt;div id=&quot;&amp;amp;&quot;&gt;'
]

{ #category : #tests }
WAEncoderTest >> testEncodedXmlUnicde [
	| lineSeparator paragraphSeparator snowMan string |
	lineSeparator := Character codePoint: 16r2028.
	paragraphSeparator := Character codePoint: 16r2028.
	paragraphSeparator := Character codePoint: 16r2028.
	snowMan := Character codePoint: 16r2603.
	string := (String with: lineSeparator), (String with: paragraphSeparator), (String with: snowMan).
	self assert: string xmlEncodedGives: string
]

{ #category : #tests }
WAEncoderTest >> testEncodedXmlUnicdeSmp [
	| emoji string |
	emoji := Character codePoint: 16r1F64C.
	string := (String with: emoji).
	self assert: string xmlEncodedGives: string
]
