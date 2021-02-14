Class {
	#name : #WAUtf8FileTest,
	#superclass : #TestCase,
	#instVars : [
		'file'
	],
	#category : 'Seaside-Tests-UTF8'
}

{ #category : #private }
WAUtf8FileTest >> asString: aCollectionOfIntegers [
	^ String streamContents: [ :stream |
		aCollectionOfIntegers do: [ :each |
			stream nextPut: (Character codePoint: each) ] ]
]

{ #category : #private }
WAUtf8FileTest >> brokenUnicodeString [
	^ self asString: #(83 195 169 195 164 115 195 174 100 195 169)
]

{ #category : #running }
WAUtf8FileTest >> setUp [
	file := WAFile new
]

{ #category : #tests }
WAUtf8FileTest >> testContents [
	file contents: #(83 195 169 195 164 115 195 174 100 195 169) asByteArray.
	self assert: file rawContents = #(83 195 169 195 164 115 195 174 100 195 169) asByteArray.
	self assert: (file contentsDecodedUsing: 'ISO-8859-1') = self brokenUnicodeString.
	self assert: (file contentsDecodedUsing: 'UTF-8') = self unicodeString
]

{ #category : #tests }
WAUtf8FileTest >> testContentsDecoded [
	file contents:  #(83 195 169 195 164 115 195 174 100 195 169) asByteArray.
	self should: [ file contentsDecoded ] raise: WAIllegalStateException.
	file contentType: 'text/plain'.
	self should: [ file contentsDecoded ] raise: WAIllegalStateException.
	file contentType: 'text/plain; charset=utf-8' seasideMimeType.
	self assert: file contentsDecoded = self unicodeString
	
]

{ #category : #private }
WAUtf8FileTest >> unicodeString [
	^ self asString: #(83 233 228 115 238 100 233)
]
