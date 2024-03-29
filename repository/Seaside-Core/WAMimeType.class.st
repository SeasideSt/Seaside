"
A WAMimeType abstracts a Internet media type, it is a two-part identifier for file formats on the Internet.

Instance Variables
	main:			<String>
	parameters:	<GRSmallDictionary>
	sub:			<String>

main
	- the main type

parameters
	- a lazily initialized dictionary of optional parameters

sub
	- the subtype

"
Class {
	#name : 'WAMimeType',
	#superclass : 'WAObject',
	#instVars : [
		'main',
		'sub',
		'parameters'
	],
	#category : 'Seaside-Core-HTTP',
	#package : 'Seaside-Core',
	#tag : 'HTTP'
}

{ #category : 'convenience' }
WAMimeType class >> applicationAtomXml [
	^ self main: 'application' sub: 'atom+xml'
]

{ #category : 'convenience' }
WAMimeType class >> applicationJson [
	^ self main: 'application' sub: 'json'
]

{ #category : 'convenience' }
WAMimeType class >> applicationOctetStream [
	^ self main: 'application' sub: 'octet-stream'
]

{ #category : 'convenience' }
WAMimeType class >> applicationRssXml [
	^ self main: 'application' sub: 'rss+xml'
]

{ #category : 'convenience' }
WAMimeType class >> formUrlencoded [
	^ self main: 'application' sub: 'x-www-form-urlencoded'
]

{ #category : 'instance creation' }
WAMimeType class >> fromString: aString [ 
	| main endOfSub sub parameters slashIndex |
	slashIndex := aString indexOf: $/.
	slashIndex = 0
		ifTrue: [
			"work arount for Issue 655
			some user agents just send '*', not '*/*'"
			endOfSub := aString indexOf: $;.
			endOfSub = 0
				ifTrue: [
					main := aString.
					endOfSub := aString size ]
				ifFalse: [
					main := aString copyFrom: 1 to: endOfSub - 1 ].
			sub := main ]
		ifFalse: [
			main := aString copyUpTo: $/.
			endOfSub := aString indexOf: $;.
			endOfSub := endOfSub = 0 
				ifTrue: [ aString size ]
				ifFalse: [ endOfSub - 1 ].
			sub := aString 
				copyFrom: main size + 2
				to: endOfSub ].
	endOfSub = aString size ifTrue: [
		^ self 
			main: main
			sub: sub ].
	parameters := GRSmallDictionary2 new.
	GRPlatform subStringsIn: (aString copyFrom: endOfSub + 1 to: aString size) splitBy: $; do: [ :each |
		parameters 
			at: (each copyUpTo: $=) trimBoth
			put: (each copyAfter: $=) trimBoth ].
	^ self 
		main: main
		sub: sub
		parameters: parameters
]

{ #category : 'convenience' }
WAMimeType class >> imageGif [
	^ self main: 'image' sub: 'gif'
]

{ #category : 'convenience' }
WAMimeType class >> imageJpeg [
	^ self main: 'image' sub: 'jpeg'
]

{ #category : 'convenience' }
WAMimeType class >> imagePng [
	^ self main: 'image' sub: 'png'
]

{ #category : 'instance creation' }
WAMimeType class >> main: aMainString sub: aSubString [
	^ self new
		main: aMainString;
		sub: aSubString;
		yourself
]

{ #category : 'instance creation' }
WAMimeType class >> main: aMainString sub: aSubString parameters: aDictionary [
	^ (self main: aMainString sub: aSubString)
		parameters: aDictionary;
		yourself
]

{ #category : 'convenience' }
WAMimeType class >> textCss [
	^ self main: 'text' sub: 'css'
]

{ #category : 'convenience' }
WAMimeType class >> textHtml [
	^ self main: 'text' sub: 'html'
]

{ #category : 'convenience' }
WAMimeType class >> textJavascript [
	^ self main: 'text' sub: 'javascript'
]

{ #category : 'convenience' }
WAMimeType class >> textPlain [
	^ self main: 'text' sub: 'plain'
]

{ #category : 'comparing' }
WAMimeType >> = other [
	^ (other isKindOf: WAMimeType)
		and: [ self main = other main
		and: [ self sub = other sub ] ]
]

{ #category : 'parameters' }
WAMimeType >> charSet [
	^ self parameters at: 'charset' ifAbsent: [ nil ]
]

{ #category : 'parameters' }
WAMimeType >> charset: aString [
	self parameters at: 'charset' put: aString
]

{ #category : 'converting' }
WAMimeType >> greaseString [
	| stringSize string stream |
	stringSize := main size + 1 + sub size.
	parameters isNil ifFalse: [
		parameters keysAndValuesDo: [ :key :value |
			stringSize := stringSize + 1 + key size + 1 + value size ] ].
	"allocate with correct size, avoid copy"
	string := String new: stringSize.
	stream := WriteStream on: string.
	stream
		nextPutAll: main;
		nextPut: $/;
		nextPutAll: sub.
	parameters isNil ifFalse: [
		parameters keysAndValuesDo: [ :key :value | 
			stream
				nextPut: $;;
				nextPutAll: key;
				nextPut: $=;
				nextPutAll: value ] ].
	"no need for #contents because we allocated with the correct size"
	^ string
]

{ #category : 'comparing' }
WAMimeType >> hash [
	^ self main hash bitXor: self sub hash
]

{ #category : 'testing' }
WAMimeType >> isBinary [
	"answers whether the contents of a document of the receiving mime type are binary"
	self main = 'text' ifTrue: [ ^ false ].
	self main = 'application'
		ifTrue: [
			"application/json is text"
			self sub = 'json' ifTrue: [ ^ false ] ].
	GRPlatform subStringsIn: self sub splitBy: $+ do: [ :each |
		"application/(x-)javascript and application/xml are text"
		(#('x-javascript' 'javascript' 'xml') includes: each)
			ifTrue: [ ^ false ] ].
	^ true
]

{ #category : 'testing' }
WAMimeType >> isNonStandard [
	"tests if the receiver is a non-standard mime type that is not registered with IANA"
	^ (self main beginsWithSubCollection: 'x-')
		or: [ (self main beginsWithSubCollection: 'X-')
		or: [ (self sub beginsWithSubCollection: 'x-')
		or: [ self sub beginsWithSubCollection: 'X-' ] ] ]
]

{ #category : 'testing' }
WAMimeType >> isVendorSpecific [
	"tests if the receiver is a vendor specific mimetype"

	^ self sub beginsWithSubCollection: 'vnd.'
]

{ #category : 'accessing' }
WAMimeType >> main [
	^ main
]

{ #category : 'accessing' }
WAMimeType >> main: aString [
	main := aString
]

{ #category : 'testing' }
WAMimeType >> matches: aMimeType [
	"aMimeType is the pattern to match, it is a normal WAMimeType instance where main or sub can be wildcards"
	^ (aMimeType main = '*'
		or: [ aMimeType main = self main ])
		and: [
			aMimeType sub = '*'
				or: [ aMimeType sub = self sub ] ]
]

{ #category : 'parameters' }
WAMimeType >> parameterAt: aKey put: aValue [
	self parameters at: aKey put: aValue
]

{ #category : 'accessing' }
WAMimeType >> parameters [
	parameters isNil ifTrue: [ parameters := GRSmallDictionary2 new ].
	^ parameters
]

{ #category : 'accessing' }
WAMimeType >> parameters: aDictionary [
	parameters := aDictionary
]

{ #category : 'printing' }
WAMimeType >> printOn: aStream [ 
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self greaseString;
		nextPut: $)
]

{ #category : 'converting' }
WAMimeType >> seasideMimeType [
	^ self
]

{ #category : 'accessing' }
WAMimeType >> sub [
	^ sub
]

{ #category : 'accessing' }
WAMimeType >> sub: aString [
	sub := aString
]
