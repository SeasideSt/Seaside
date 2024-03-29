Extension { #name : 'GRPlatform' }

{ #category : '*Seaside-Core' }
GRPlatform >> doCommitTransaction [
	"GemStone/S should commit the transaction here."
	^ self
]

{ #category : '*Seaside-Core' }
GRPlatform >> newReducedConflictCounter [
	"GemStone/S should answer an RcCounter here"
	^ WAReducedConflictCounter new
]

{ #category : '*Seaside-Core' }
GRPlatform >> newTransientValueHolder [
	"GemStone/S should answer a TransientValue here"
	^ WAValueHolder new
]

{ #category : '*Seaside-Core' }
GRPlatform >> seasideVersion [
	"Answer the Seaside version"

	^ (GRVersion major: 3 minor: 5 revision: 6)
		yourself
]

{ #category : '*Seaside-Core' }
GRPlatform class >> subStringsIn: aString splitBy: aCharacter [
	| subStrings |
	subStrings := OrderedCollection new: (aString count: [ :each | each = aCharacter ]) + 1.
	self subStringsIn: aString splitBy: aCharacter do: [ :each |
		subStrings add: each ].
	^ subStrings
]

{ #category : '*Seaside-Core' }
GRPlatform class >> subStringsIn: aString splitBy: aCharacter collect: aOneArgumentBlock [
	| subStrings |
	subStrings := OrderedCollection new: (aString count: [ :each | each = aCharacter ]) + 1.
	self subStringsIn: aString splitBy: aCharacter do: [ :each |
		subStrings add: (aOneArgumentBlock value: each) ].
	^ subStrings
]

{ #category : '*Seaside-Core' }
GRPlatform class >> subStringsIn: aString splitBy: aCharacter do: aOneArgumentBlock [
	"#subStrings: can be slow on Pharo because it uses a lot of allocation so we avoid it
	see issue Issue 609"
	| startIndex |
	startIndex := aString indexOf: aCharacter.
	startIndex = 0
		ifTrue: [
			aString isEmpty ifFalse: [
				aOneArgumentBlock value: aString ] ]
		ifFalse: [
			| endIndex stringSize |
			stringSize := aString size.
			startIndex = 1 ifFalse: [
				"case where we have a path not starting with aCharacter"
				aOneArgumentBlock value: (aString copyFrom: 1 to: startIndex - 1) ].
			endIndex := aString indexOf: aCharacter startingAt: startIndex + 1.
			[ startIndex ~= 0 ] whileTrue: [
				startIndex + 1 = endIndex
					ifTrue: [
						"skip, avoid adding empty strings"
						startIndex := endIndex.
						endIndex := aString indexOf: aCharacter startingAt: startIndex + 1 ]
					ifFalse: [
						endIndex = 0
							ifTrue: [
								startIndex < stringSize ifTrue: [
									"avoid adding empty path if aString ends with aCharacter"
									aOneArgumentBlock value: (aString copyFrom: startIndex + 1 to: stringSize) ].
								startIndex := 0 ]
							ifFalse: [
								aOneArgumentBlock value: (aString copyFrom: startIndex + 1 to: endIndex  - 1).
								startIndex := endIndex.
								endIndex := aString indexOf: aCharacter startingAt: startIndex + 1 ] ] ] ]
]

{ #category : '*Seaside-Core' }
GRPlatform >> urlEncoderOn: aStream [
	"Answer an URL encoder that works on aStream.
	Platforms may provide optimized implementations."
	^ WAUrlEncoder on: aStream
]

{ #category : '*Seaside-Core' }
GRPlatform >> urlEncoderOn: aStream codec: aCodec [
	"Answer an URL encoder that works on aStream.
	Platforms may provide optimized implementations."
	^ aCodec url encoderFor: (WAUrlEncoder on: aStream)
]

{ #category : '*Seaside-Core' }
GRPlatform >> xmlEncoderOn: aStream [
	"Answer an XML encoder that works on aStream.
	Platforms may provide optimized implementations."
	^ WAXmlEncoder on: aStream
]
