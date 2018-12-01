"
A WARequestCookie is the cookie the user agent sent to the server.

Instance Variables
	domain:			<String>
	key:			<String>
	path:			<String>
	pathEncoded:	<String>
	ports:			<Collection<Integer>>
	value:			<String>
	version:			<Integer>

domain
	- xxxxx

key
	- xxxxx

path
	- xxxxx

ports
	- xxxxx

value
	- xxxxx

version
	- the version of the cookie specification supported, currently only 1 is known

"
Class {
	#name : #WARequestCookie,
	#superclass : #WAObject,
	#instVars : [
		'key',
		'path',
		'pathEncoded',
		'domain',
		'ports',
		'value',
		'version'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #accessing }
WARequestCookie class >> actions [
	^ Dictionary new
		at: '$Domain' put: [ :codec :cookie :value | cookie domain: value ];
		at: '$Path' put: [ :codec :cookie :value | cookie pathEncoded: value codec: codec ];
		at: '$Port' put: [ :codec :cookie :value | cookie setPorts: value ];
		yourself
]

{ #category : #'instance creation' }
WARequestCookie class >> fromString: aString codec: aCodec [
	"Creates an array of cookies from a HTTP Cookie: header value."
	| version current cookies |
	version := nil.
	aString isEmptyOrNil
		ifTrue: [ ^ #() ].
	current := nil.
	cookies := OrderedCollection new: 3.
	GRPlatform subStringsIn: aString splitBy: $; do: [ :each |
		| key value action |
		key := self keyFrom: each.
		value := self valueFrom: each.
		key = '$Version' 
			ifTrue: [
				version := value greaseInteger ]
			ifFalse: [
				action := self actions 
					at: key
					ifAbsent: [ nil ].
				action isNil 
					ifTrue: [
						current := self 
							key: key
							value: value.
						current version: version.
						cookies add: current ]
					ifFalse: [
						action
							value: aCodec
							value: current
							value: value ] ] ].
	^ cookies
]

{ #category : #'instance creation' }
WARequestCookie class >> key: keyString value: valueString [
	^ self new
		key: keyString;
		value: valueString;
		yourself
]

{ #category : #private }
WARequestCookie class >> keyFrom: aString [
	^ (aString copyUpTo: $=) trimBoth
]

{ #category : #private }
WARequestCookie class >> trimBlanksAndQuotes: aString [
	| trimmed |
	trimmed := aString trimBoth.
	^ (trimmed size > 2
		and: [ trimmed first = $"
		and: [ trimmed last = $" ] ])
			ifTrue: [ trimmed copyFrom: 2 to: trimmed size - 1 ]
			ifFalse: [ trimmed ]
]

{ #category : #private }
WARequestCookie class >> valueFrom: aString [
	^ (aString includes: $=)
		ifTrue: [ self trimBlanksAndQuotes: (aString copyAfter: $=) ]
]

{ #category : #comparing }
WARequestCookie >> = other [
	"cookies are identified by the triple name/domain/path"
	^ self species = other species
		and: [ self key = other key
		and: [ self domain = other domain
		and: [ self path = other path ] ] ]
]

{ #category : #accessing }
WARequestCookie >> domain [
	^ domain
]

{ #category : #accessing }
WARequestCookie >> domain: aString [
	domain := aString
]

{ #category : #comparing }
WARequestCookie >> hash [
	"see #="

	^ (self key hash bitXor: self domain hash) bitXor: self path hash
]

{ #category : #accessing }
WARequestCookie >> key [
	^ key
]

{ #category : #accessing }
WARequestCookie >> key: aString [
	key := aString
]

{ #category : #accessing }
WARequestCookie >> path [
	^ path ifNil: [ '/' ]
]

{ #category : #accessing }
WARequestCookie >> path: aString [
	self pathUnencoded: aString codec: nil
]

{ #category : #accessing }
WARequestCookie >> pathEncoded [
	^ pathEncoded
]

{ #category : #accessing }
WARequestCookie >> pathEncoded: aString codec: aCodec [
	pathEncoded := aString isNil ifTrue: [ '/' ] ifFalse: [ aString ].
	path := aString isNil
		ifTrue: [ '/' ]
		ifFalse: [
			aCodec isNil
				ifTrue: [ aString ]
				ifFalse: [ ((WAUrl absolute: aString) decodedWith: aCodec) pathStringUnencoded ] ]
]

{ #category : #accessing }
WARequestCookie >> pathUnencoded [
	^ path
]

{ #category : #accessing }
WARequestCookie >> pathUnencoded: aString codec: aCodec [
	path := aString.
	pathEncoded := aString isNil
		ifTrue: [ '/' ]
		ifFalse: [
			| codec |
			codec := aCodec isNil ifTrue: [ self requestContext codec ] ifFalse: [ aCodec ].
			String new: (aString size * 1.1) greaseInteger streamContents: [ :stream |
				| encoder |
				encoder := GRPlatform current urlEncoderOn: stream codec:  codec.
				GRPlatform subStringsIn: path splitBy: $/ do: [ :each |
					stream nextPut: $/.
					encoder nextPutAll: each ] ] ]
]

{ #category : #accessing }
WARequestCookie >> pathUnencoded: aFirstString encoded: aSecondString [
	path := aFirstString.
	pathEncoded := aSecondString
]

{ #category : #accessing }
WARequestCookie >> port: anInteger [
	self ports: (Array with: anInteger)
]

{ #category : #accessing }
WARequestCookie >> ports [
	^ ports
]

{ #category : #accessing }
WARequestCookie >> ports: aCollection [
	ports := aCollection
]

{ #category : #copying }
WARequestCookie >> postCopy [
	super postCopy.
	ports := ports copy
]

{ #category : #initialization }
WARequestCookie >> setPorts: aString [
	ports := OrderedCollection new: 1.
	GRPlatform subStringsIn: aString splitBy: $, do: [ :token |
		ports add: token greaseInteger ]
]

{ #category : #accessing }
WARequestCookie >> value [
	^ value
]

{ #category : #accessing }
WARequestCookie >> value: aString [
	value := aString
]

{ #category : #accessing }
WARequestCookie >> version [
	^ version
]

{ #category : #accessing }
WARequestCookie >> version: anInteger [
	version := anInteger
]
