Class {
	#name : 'WAGenericCodecTest',
	#superclass : 'WAContextTest',
	#category : 'Seaside-Tests-Pharo-Core',
	#package : 'Seaside-Tests-Pharo-Core'
}

{ #category : 'private' }
WAGenericCodecTest >> asByteArray: aCollectionOfIntegers [
	^ ByteArray streamContents: [ :stream |
		aCollectionOfIntegers do: [ :each |
			stream nextPut: each ] ]
]

{ #category : 'private' }
WAGenericCodecTest >> asString: aCollectionOfIntegers [
	^ String streamContents: [ :stream |
		aCollectionOfIntegers do: [ :each |
			stream nextPut: (Character codePoint: each) ] ]
]

{ #category : 'private' }
WAGenericCodecTest >> latin1String [
	^ self asString: #(220 98 232 114 115 116 114 238 241 103 233)
]

{ #category : 'private' }
WAGenericCodecTest >> macromanByteArray [
	^ self asByteArray: #(134 98 143 114 115 116 114 148 150 103 142)
]

{ #category : 'private' }
WAGenericCodecTest >> macromanString [
	^ self asString: #(134 98 143 114 115 116 114 148 150 103 142)
]

{ #category : 'tests' }
WAGenericCodecTest >> testGenericCodecAll [
	(Smalltalk at: #GRPharoGenericCodec ifAbsent: [ GRPharoZnCodec ])  supportedEncodingNames do: [ :name | 
		(GRPharoLatin1Codec supportedEncodingNames includes: name) ifFalse: [
			| codec |
			codec := GRCodec forEncoding: name.
			self assert: codec name = name.
			self assert: (codec isKindOf: (Smalltalk at: #GRPharoGenericCodec ifAbsent: [ GRPharoZnCodec ])) ] ]
]

{ #category : 'tests' }
WAGenericCodecTest >> testGenericCodecMacRoman [
	| codec |
	codec := GRCodec forEncoding: 'mac-roman'.
	self assert: codec name = 'mac-roman'.
	self assert: (#('utf-8' 'utf8') includes: codec url name).
	codec encodedStringClass == ByteArray
		ifTrue: [ self assert: (codec encode: self latin1String) = self macromanByteArray ]
		ifFalse: [ self assert: (codec encode: self latin1String) = self macromanString ].
	codec url encodedStringClass == ByteArray
		ifTrue:[ self assert: (codec url encode: self latin1String) = self utf8ByteArray ]
		ifFalse:[ self assert: (codec url encode: self latin1String) = self utf8String ].
	self assert: (codec decode: self macromanString) = self latin1String.
	self assert: (codec url decode: self utf8String) = self latin1String
]

{ #category : 'tests' }
WAGenericCodecTest >> testGenericCodecUtf16be [
	| codec bom |
	codec := GRCodec forEncoding: 'utf-16'.
	bom := self asString: #(254 255).
	self assert: codec name = 'utf-16'.
	self assert: (#('utf-8' 'utf8') includes: codec url name).
	codec encodedStringClass == ByteArray
		ifTrue: [ self assert: (codec encode: self latin1String) = self utf16ByteArray ]
		ifFalse: [ self assert: (codec encode: self latin1String) = self utf16beString ].
	codec url encodedStringClass == ByteArray
		ifTrue:[ self assert: (codec url encode: self latin1String) = self utf8ByteArray ]
		ifFalse:[ self assert: (codec url encode: self latin1String) = self utf8String ].
	self assert: (codec decode: self utf16beString) = self latin1String.
	self assert: (codec decode: bom , self utf16beString) = self latin1String.
	self assert: (codec url decode: self utf8String) = self latin1String
]

{ #category : 'tests' }
WAGenericCodecTest >> testGenericCodecUtf16le [
	| codec bom |
	codec := GRCodec forEncoding: 'utf-16'.
	bom := self asString: #(255 254).
	self assert: codec name = 'utf-16'.
	self assert: (#('utf-8' 'utf8') includes: codec url name).
	codec encodedStringClass == ByteArray
		ifTrue: [ self assert: (codec encode: self latin1String) = self utf16ByteArray ]
		ifFalse: [ self assert: (codec encode: self latin1String) = self utf16beString ].
	codec url encodedStringClass == ByteArray
		ifTrue:[ self assert: (codec url encode: self latin1String) = self utf8ByteArray ]
		ifFalse:[ self assert: (codec url encode: self latin1String) = self utf8String ].
	self assert: (codec decode: bom , self utf16leString) = self latin1String.
	self assert: (codec url decode: self utf8String) = self latin1String
	

]

{ #category : 'tests' }
WAGenericCodecTest >> testSqueakCodecLatin1 [
	"tests the codec for 'lating-1' and #converter"
	#('iso-8859-1' 'ISO-8859-1' 'latin-1' ) do: [ :each | 
		| codec |
		codec := GRCodec forEncoding: each.
		self assert: codec name = each.
		self assert: codec url name = each.
		self assert: (codec encode: self latin1String) = self latin1String.
		self assert: (codec url encode: self latin1String) = self latin1String.
		self assert: (codec decode: self latin1String) = self latin1String.
		self assert: (codec url decode: self latin1String) = self latin1String ]
]

{ #category : 'private' }
WAGenericCodecTest >> utf16ByteArray [
	^ self asByteArray: #(0 220 0 98 0 232 0 114 0 115 0 116 0 114 0 238 0 241 0 103 0 233)
]

{ #category : 'private' }
WAGenericCodecTest >> utf16beString [
	^ self asString: #(0 220 0 98 0 232 0 114 0 115 0 116 0 114 0 238 0 241 0 103 0 233)
]

{ #category : 'private' }
WAGenericCodecTest >> utf16leString [
	^ self asString: #(220 0 98 0 232 0 114 0 115 0 116 0 114 0 238 0 241 0 103 0 233 0)
]

{ #category : 'private' }
WAGenericCodecTest >> utf8ByteArray [
	^ self asByteArray: #(195 156 98 195 168 114 115 116 114 195 174 195 177 103 195 169)
]

{ #category : 'private' }
WAGenericCodecTest >> utf8String [
	^ self asString: #(195 156 98 195 168 114 115 116 114 195 174 195 177 103 195 169)
]
