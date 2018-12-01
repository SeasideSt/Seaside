Class {
	#name : #WAPharoEncoderTest,
	#superclass : #WAEncoderUnicodeTest,
	#category : 'Seaside-Tests-Pharo-Core'
}

{ #category : #private }
WAPharoEncoderTest >> assert: aString next: anInteger startingAt: startIndex encoder: aClass gives: anEncodedString [
	| actual |
	actual := String streamContents: [ :stream |
		(aClass on: stream codec: self requestContext codec)
			greaseNext: anInteger putAll: aString startingAt: startIndex ].
	self assert: actual = anEncodedString
]

{ #category : #tests }
WAPharoEncoderTest >> testGreaseNextPutAllStartingAt [
	self
		assert: '$(&quot;#seastar&quot;).animate({&quot;left&quot;:&quot;-=100px&quot;},{})'
		next: 13
		startingAt: 4
		encoder: self xmlEncoderClass
		gives:  'quot;#seastar'
]

{ #category : #tests }
WAPharoEncoderTest >> testIncludesUnsafeUrlCharacter [
	| encoder unsafeCharacters |
	encoder := WAPharoUrlEncoder on: (WriteStream on: String new).
	unsafeCharacters := ((0 to: 127)
		collect: [ :each | Character codePoint: each ])
		reject: [ :each | 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~' includes: each ].
	
	unsafeCharacters do: [ :each |
		self assert: (encoder includesUnsafeCharacter: (String with: each)).
		self assert: (encoder includesUnsafeCharacter: 'a', (String with: each)).
		self assert: (encoder includesUnsafeCharacter: (String with: each), 'a') ].
	
	"make sure the method does not blow up on empty strings"
	encoder includesUnsafeCharacter: ''
]

{ #category : #tests }
WAPharoEncoderTest >> testIncludesUnsafeXmlCharacter [
	| encoder |
	encoder := WAPharoXmlEncoder on: (WriteStream on: String new).
	'"<&' do: [ :each |
		self assert: (encoder includesUnsafeCharacter: (String with: each)).
		self assert: (encoder includesUnsafeCharacter: 'a', (String with: each)).
		self assert: (encoder includesUnsafeCharacter: (String with: each), 'a') ].
	
	"just make sure the method doesn't blow up on empty strings"
	encoder includesUnsafeCharacter: ''
]

{ #category : #tests }
WAPharoEncoderTest >> testUrlGreaseNextPutAllStartingAt [
	self assert: 'ab' next: 1 startingAt: 1 encoder: self urlEncoderClass gives:  'a'.
	self assert: 'a b' next: 1 startingAt: 1 encoder: self urlEncoderClass gives:  'a'.
	self assert: 'a b' next: 2 startingAt: 1 encoder: self urlEncoderClass gives:  'a%20'.
	self assert: 'a b' next: 1 startingAt: 2 encoder: self urlEncoderClass gives:  '%20'.
	self assert: 'a b' next: 2 startingAt: 2 encoder: self urlEncoderClass gives:  '%20b'.
	self assert: 'a  ' next: 2 startingAt: 2 encoder: self urlEncoderClass gives:  '%20%20'.
	self assert: 'ab b ' next: 3 startingAt: 2 encoder: self urlEncoderClass gives:  'b%20b'
]

{ #category : #tests }
WAPharoEncoderTest >> testXmlGreaseNextPutAllStartingAt [
	self assert: 'ab' next: 1 startingAt: 1 encoder: self xmlEncoderClass gives:  'a'.
	self assert: 'a<b' next: 1 startingAt: 1 encoder: self xmlEncoderClass gives:  'a'.
	self assert: 'a<b' next: 2 startingAt: 1 encoder: self xmlEncoderClass gives:  'a&lt;'.
	self assert: 'a<b' next: 1 startingAt: 2 encoder: self xmlEncoderClass gives:  '&lt;'.
	self assert: 'a<b' next: 2 startingAt: 2 encoder: self xmlEncoderClass gives:  '&lt;b'.
	self assert: 'a<<b' next: 2 startingAt: 2 encoder: self xmlEncoderClass gives:  '&lt;&lt;'.
	self assert: 'ab<b<' next: 3 startingAt: 2 encoder: self xmlEncoderClass gives:  'b&lt;b'
]

{ #category : #private }
WAPharoEncoderTest >> urlEncoderClass [
	^ WAPharoUrlEncoder
]

{ #category : #private }
WAPharoEncoderTest >> xmlEncoderClass [
	^ WAPharoXmlEncoder
]
