"
I represent all portions of an URL as described by the RFC 1738 and updated by RFC 3986. I include scheme, userinfo, host, port, path, parameter, query, and fragment.

Instance Variables
	scheme:			<String> or nil
	user:				<String> or nil
	password:			<String> or nil
	host:				<String> or nil
	port:				<Integer> or nil
	path:				<OrderedCollection> or nil
	slash:				<Boolean>
	queryFields:		<WARequestFields> or nil
	fragment:			<String> or nil
	pathParameters:	<GROrderedMultiMap> or nil
		
A Primer on URL encoding:
http://blog.lunatech.com/2009/02/03/what-every-web-developer-must-know-about-url-encoding
		
Path Parameters:
http://doriantaylor.com/policy/http-url-path-parameter-syntax
you can have multiple name without values
/path/name;param1;p2;p3
or names with multiple values
;param=val1,val2,val3
"
Class {
	#name : 'WAUrl',
	#superclass : 'WAObject',
	#instVars : [
		'scheme',
		'user',
		'password',
		'host',
		'port',
		'path',
		'slash',
		'queryFields',
		'fragment',
		'pathParameters'
	],
	#category : 'Seaside-Core-HTTP',
	#package : 'Seaside-Core',
	#tag : 'HTTP'
}

{ #category : 'parsing' }
WAUrl class >> absolute: aString [
	"Parse aString as an absolute URL."

	^ self basicNew initializeFromString: aString
]

{ #category : 'parsing' }
WAUrl class >> absolute: aString relative: aRelativeString [
	"Take absolute URL aString and combine it with a relative path aRelativeString."

	^ (self absolute: aString)
		parsePath: aRelativeString;
		yourself
]

{ #category : 'decoding' }
WAUrl class >> decodePercent: aString [
	"percent decodes the given String"
	| input output char |
	input := aString readStream.
	output := WriteStream on: (String new: aString size).
	[ input atEnd ] whileFalse: [
		char := input next.
		output nextPut: (char = $+
			ifTrue: [ Character space ]
			ifFalse: [
				char = $%
					ifTrue: [
						| firstByte secondByte |
						firstByte :=  self readHexFrom: input errorDetail: aString.
						secondByte :=  self readHexFrom: input errorDetail: aString.
						Character codePoint: firstByte * 16 + secondByte ]
					ifFalse: [ char ] ]) ].
	^ output contents
]

{ #category : 'decoding' }
WAUrl class >> decodePercent: aString from: start [
	"percent decodes the fragment string starting at the given index
	/?:@-._~!$&'()*+,;= are allowed unescaped anywhere within a fragment part"
	^ self decodePercent: aString from: start to: aString size + 1
]

{ #category : 'decoding' }
WAUrl class >> decodePercent: aString from: start to: end [
	"percent decodes the string starting at the given index"
	| input output index left |
	index := aString indexOf: $% startingAt: start.
	(index = 0 or: [ index >= end ])
		ifTrue: [ ^ aString copyFrom: start to: end - 1 ].
	input := aString readStream.
	input skip: start - 1. "start index 1 -> skip 0"
	output := WriteStream on: (String new: aString size).
	left := end - start.
	[ left > 0 and: [ input atEnd not ] ] whileTrue: [
		| char |
		char := input next.
		output nextPut: (char = $%
			ifTrue: [
				| firstByte secondByte |
				firstByte :=  self readHexFrom: input errorDetail: aString.
				secondByte :=  self readHexFrom: input errorDetail: aString.
				left := left - 3.
				Character codePoint:firstByte * 16 + secondByte ]
			ifFalse: [
				left := left - 1.
				char ]) ].
	^ output contents
]

{ #category : 'decoding' }
WAUrl class >> decodePercentAndPlus: aString from: start to: end [
	"percent decodes the given String"
	| percentIndex input output left |
	"check if we contain %"
	percentIndex := aString indexOf: $% startingAt: start.
	(percentIndex = 0 or: [ percentIndex >= end ]) ifTrue: [
		| plusIndex |
		"check if we contain +"
		plusIndex := aString indexOf: $+ startingAt: start.
		(plusIndex = 0 or: [ plusIndex >= end ]) ifTrue: [
			^ aString copyFrom: start to: end - 1 ] ].
	
	"we contain either % or +"
	input := aString readStream.
	input skip: start - 1. "start index 1 -> skip 0"
	output := WriteStream on: (String new: aString size).
	left := end - start.
	[ left > 0 and: [ input atEnd not ] ] whileTrue: [
		| char |
		char := input next.
		output nextPut: (char = $+
			ifTrue: [
				left := left - 1.
				Character space ]
			ifFalse: [
				char = $%
					ifTrue: [
						| firstByte secondByte |
						firstByte :=  self readHexFrom: input errorDetail: aString.
						secondByte :=  self readHexFrom: input errorDetail: aString.
						left := left - 3.
						Character codePoint:firstByte * 16 + secondByte ]
					ifFalse: [
						left := left - 1.
						char ] ]) ].
	^ output contents
]

{ #category : 'private' }
WAUrl class >> readHexFrom: aStream errorDetail: aString [
	| hexChar |
	aStream atEnd ifTrue: [
		WAInvalidUrlSyntaxError signal: aString ].
	hexChar := aStream next.
	((hexChar between: $0 and: $9)
		or: [ (hexChar between: $a and: $f)
		or: [ hexChar between: $A and: $F ] ]) ifFalse: [ WAInvalidUrlSyntaxError signal: aString ].
	^ hexChar asUppercase digitValue
]

{ #category : 'comparing' }
WAUrl >> = aUrl [
	^ self class = aUrl class and: [ self printString = aUrl printString ]
]

{ #category : 'adding' }
WAUrl >> addAllToPath: aCollectionOfStrings [
	"Add a collection of strings to the path."
	
	aCollectionOfStrings do: [ :each | self addToPath: each ]
]

{ #category : 'adding' }
WAUrl >> addField: aKey [
	"Add the query field aKey to the receiving url."

	self addField: aKey value: nil
]

{ #category : 'adding' }
WAUrl >> addField: aKey value: aValue [
	"Add the query field aKey with aValue to the receiving url."
	
	aKey isEmpty 
		ifFalse: [ self queryFields at: aKey add: aValue ]
]

{ #category : 'adding' }
WAUrl >> addPathParameterAt: anIndex key: aKey [
	"Add the path parameter aKey to the path element at anIndex."
	(self privatePathParameterMapAt: anIndex) at: aKey put: nil
]

{ #category : 'adding' }
WAUrl >> addPathParameterAt: anIndex key: aKey value: aValue [
	"Add the path parameter aKey with aKey to the path element at anIndex."
	(self privatePathParameterMapAt: anIndex) at: aKey add: aValue
]

{ #category : 'adding' }
WAUrl >> addToPath: aString [
	"Adds the argument as a path element. If the argument contains $/ it is split into multiple elements."

	| p |
	p := self path.
	self pathElementsIn: aString do: [ :each |
		p add: each ].
	self slash: (aString notEmpty and: [ aString last = $/ ])
]

{ #category : 'private' }
WAUrl >> decode: aString [
	"percent decodes the given String"

	^ self class decodePercent: aString
]

{ #category : 'converting' }
WAUrl >> decodedWith: aCodec [
	"answers a copy of the receiver decoded with the given codec
	http://www.ietf.org/rfc/rfc3987.txt"
	| url |
	url := self copy.
	
	"scheme, host, port cannot include escaped characters (%FF) and so should not
	be able to include characters that need decoding"
	
	"userinfo (username + password) can be percent encoded"
	self user isNil ifFalse: [
		url user: (aCodec url decode: self user) ].
	self password isNil ifFalse: [
		url password: (aCodec url decode: self password) ].
	
	self path isEmpty ifFalse: [
		url path: (self path collect: [ :each | aCodec url decode: each ]) ].
	url queryFields: nil.
	self queryFields keysAndValuesDo: [ :key :value |
		url
			addField: (aCodec url decode: key)
			value: (value isNil ifFalse: [ aCodec url decode: value ]) ].
	self fragment isNil ifFalse: [
		url fragment: (aCodec url decode: self fragment) ].
	
	^ url
]

{ #category : 'private' }
WAUrl >> detectCommonPathElementClass [
	"Detect if all path elements are of the same class. Answer that class if that is the case.
	Answer nil otherwise.
	
	If all the elements are of the same class we can avoid sending #contents to the wirte stream
	because we can allocate a collection of the right size and type. This is important because
	#contents does an additional copy which shows up in benchmarks.
	If the lements are not of the same class we can not know the type of the target collection
	(in a portable way) and have to use stream #contents."
	| firstSpecies |
	path isEmptyOrNil ifTrue: [
		^ '' species ].
	firstSpecies := (path at: 1) species.
	2 to: path size do: [ :index |
		(path at: index) species ~= firstSpecies
			ifTrue: [ ^ nil ] ].
	^ firstSpecies
]

{ #category : 'encoding' }
WAUrl >> encodeFragmentOn: aDocument [
	aDocument urlEncoder nextPutAll: fragment
]

{ #category : 'encoding' }
WAUrl >> encodeOn: aDocument [
	self encodeSchemeAndAuthorityOn: aDocument.
	self encodePathOn: aDocument.
	(queryFields isNil or: [ queryFields isEmpty ]) ifFalse: [
		aDocument xmlEncoder nextPut: $?.
		self encodeQueryOn: aDocument ].
	fragment isNil ifFalse: [
		aDocument xmlEncoder nextPut: $#.
		self encodeFragmentOn: aDocument ]
]

{ #category : 'encoding' }
WAUrl >> encodePathOn: aDocument [
	path isNil ifFalse: [
		path keysAndValuesDo: [ :index :each |
			aDocument nextPut: $/.
			aDocument urlEncoder nextPutAll: each.
			pathParameters isNil ifFalse: [
				self encodePathParametersAt: index on: aDocument ] ] ].
	(path isNil or: [ path isEmpty or: [ slash ] ])
		ifTrue: [ aDocument nextPut: $/ ]
]

{ #category : 'encoding' }
WAUrl >> encodePathParametersAt: anIndex on: aDocument [
	self
		privatePathParameterMapAt: anIndex
		ifPresentDo: [ :parameters |
			parameters keysAndAllValuesDo: [ :key :values |
				aDocument nextPut: $;.
				aDocument urlEncoder nextPutAll: key.
				(values size = 1 and: [ values first isNil ]) ifFalse: [
					aDocument nextPut: $=.
					values
						do: [ :value | aDocument urlEncoder nextPutAll: value greaseString ]
						separatedBy: [ aDocument nextPut: $, ] ] ] ]
		ifAbsent: [ "ignore" ]
]

{ #category : 'encoding' }
WAUrl >> encodeQueryOn: aDocument [ 
	| first |
	first := true.
	self queryFields keysAndValuesDo: [ :key :value |
		first ifFalse: [ aDocument xmlEncoder nextPut: $& ].
		first := false.
		aDocument urlEncoder nextPutAll: key.
		value isNil ifFalse: [
			aDocument nextPut: $=.
			aDocument urlEncoder nextPutAll: value greaseString ] ]
]

{ #category : 'encoding' }
WAUrl >> encodeSchemeAndAuthorityOn: aDocument [
	host ifNil: [ ^ self ].
	aDocument nextPutAll: self scheme; nextPutAll: '://'.
	user notNil ifTrue: [
		aDocument urlEncoder nextPutAll: user.
		password notNil ifTrue: [
			aDocument nextPut: $:.
			aDocument urlEncoder nextPutAll: password ].
		aDocument nextPut: $@ ].
	aDocument urlEncoder nextPutAll: host.
	port notNil ifTrue: [
		((self scheme = 'http' and: [ port = 80 ])
			or: [ self scheme = 'https' and: [ port = 443 ] ])
			ifFalse: [ aDocument nextPut: $:; print: port ] ]
]

{ #category : 'accessing' }
WAUrl >> fragment [
	"Answer the fragment part of the URL."

	^ fragment
]

{ #category : 'accessing' }
WAUrl >> fragment: aString [
	fragment := aString
]

{ #category : 'comparing' }
WAUrl >> hash [
	^ self host hash bitXor: self path hash
]

{ #category : 'accessing' }
WAUrl >> host [
	"Answer the host part of the URL."

	^ host
]

{ #category : 'accessing' }
WAUrl >> host: aString [
	host := aString isNil
		ifFalse: [ aString greaseString asLowercase ]
]

{ #category : 'initialization' }
WAUrl >> initialize [
	super initialize.
	slash := false
]

{ #category : 'initialization' }
WAUrl >> initializeFromString: aString [
	| fragmentIndex queryIndex schemeIndex pathStart stringSize pathEnd authorityStart authorityEnd startWithPath |
	self initialize.
	stringSize := aString size.
	fragmentIndex := aString indexOf: $#.
	fragmentIndex > 0 ifTrue: [
		self
			parseFragment: aString
			from: fragmentIndex + 1 ].
	queryIndex := aString indexOf: $?.
	(queryIndex > 0 and: [ fragmentIndex = 0 or: [ queryIndex < fragmentIndex ] ]) ifTrue: [
		self
			parseQuery: aString 
			from: queryIndex + 1
			to: (fragmentIndex = 0 ifTrue: [ stringSize + 1 ] ifFalse: [ fragmentIndex ]) ].
	schemeIndex := aString indexOfSubCollection: '://'.
	
	(schemeIndex > 0 and: [ (fragmentIndex = 0 or: [ schemeIndex < fragmentIndex ]) and: [ queryIndex = 0 or: [ schemeIndex < queryIndex ] ] ])
		ifTrue: [
			startWithPath := false.
			self scheme: (aString copyFrom: 1 to: schemeIndex - 1).
			pathStart := aString indexOf: $/ startingAt: schemeIndex + 3.
			authorityStart := schemeIndex + 3 ]
		ifFalse: [
			startWithPath := true.
			pathStart := aString indexOf: $/ startingAt: 1.
			authorityStart := 0 ].
	
	pathStart > 0
		ifTrue: [
			(pathStart > fragmentIndex and: [ fragmentIndex > 0 ]) ifTrue: [
				WAInvalidUrlSyntaxError signal: aString ].
			(pathStart > queryIndex and: [ queryIndex > 0 ]) ifTrue: [
				WAInvalidUrlSyntaxError signal: aString ].
			authorityEnd := pathStart ]
		ifFalse: [
			(fragmentIndex > 0 or: [ queryIndex > 0 ]) ifTrue: [
				WAInvalidUrlSyntaxError signal: aString ].
			authorityEnd := stringSize + 1 ].
	
	authorityStart > 0 ifTrue: [
		self parseAuthority: aString from: authorityStart to: authorityEnd ].
	
	pathEnd := stringSize + 1.
	fragmentIndex > 0 ifTrue: [
		pathEnd := fragmentIndex ].
	(queryIndex > 0 and: [ fragmentIndex = 0 or: [ queryIndex < fragmentIndex ] ]) ifTrue: [
		pathEnd := queryIndex ].
	
	startWithPath
		ifTrue: [
			(stringSize > 0 and: [ (aString at: 1) = $/ ])
				ifTrue: [ self parsePath: aString absolute: true from: 2 to: pathEnd ]
				ifFalse: [ self parsePath: aString absolute: false from: 1 to: pathEnd ] ]
		ifFalse: [
			pathStart > 0 ifTrue: [
				self parsePath: aString absolute: true from: pathStart + 1 to: pathEnd ] ]
]

{ #category : 'private' }
WAUrl >> isSeasideField: aString [
	^ aString notEmpty
		and: [ aString first = $_
		or: [ aString allSatisfy: [ :each | each isDigit ] ] ]
]

{ #category : 'testing' }
WAUrl >> isSsl [
	^ self scheme isEmptyOrNil not
		and: [ self scheme last = $s ]
]

{ #category : 'parsing' }
WAUrl >> parseAuthority: aString from: start to: end [
	| atIndex hostStart |
	atIndex := aString indexOf: $@ startingAt: start.
	(atIndex > 0 and: [ atIndex < end ])
		ifTrue: [
			self parseUserPassword: aString from: start to: atIndex.
			hostStart := atIndex + 1 ]
		ifFalse: [
			hostStart := start ].
		
	self parseHostPort: aString from: hostStart to: end
]

{ #category : 'parsing' }
WAUrl >> parseFragment: aString from: startIndex [
	startIndex > aString size ifTrue: [ ^ self ].
	self fragment: (self class decodePercent: aString from: startIndex)
]

{ #category : 'parsing' }
WAUrl >> parseHostPort: aString from: start to: end [
	| colonIndex |
	colonIndex := aString indexOf: $: startingAt: start.
	(colonIndex > 0 and: [ colonIndex < end ])
		ifTrue: [
			start < colonIndex ifTrue: [
				"don't set host when empty"
				self host: (self class decodePercent: aString from: start to: colonIndex) ].
			self port: (self parsePort: aString from: colonIndex + 1 to: end) ]
		ifFalse: [
			start < end ifTrue: [
				"don't set host when empty"
				self host: (self class decodePercent: aString from: start to: end) ] ]
]

{ #category : 'parsing' }
WAUrl >> parsePath: aString [
	| absolute |
	absolute := aString notEmpty and: [ aString first = $/ ].
	self
		parsePath: aString
		absolute: absolute
		from: (absolute ifTrue: [ 2 ] ifFalse: [ 1 ])
		to: aString size + 1
]

{ #category : 'parsing' }
WAUrl >> parsePath: aString absolute: absolute from: start to: end [
	| p index elementStart |
	absolute ifTrue: [
		path := nil.
		pathParameters := nil ].
	p := self path.
	index := p size.
	
	elementStart := start.
	[ elementStart < end and: [ (aString at: elementStart) = $/ ] ] whileTrue: [
			elementStart := elementStart + 1 ].
	[ elementStart > 0 and: [ elementStart < end ] ] whileTrue: [
		| elementEnd elementSize |
		elementEnd := aString indexOf: $/ startingAt: elementStart + 1.
		(elementEnd > 0 and: [ elementEnd < end ]) ifFalse: [
			elementEnd := end ].
		elementSize := elementEnd - elementStart.
		elementSize > 0 ifTrue: [
			"avoid empty stings"
			(elementSize = 1 and: [ (aString at: elementStart) = $. ]) ifFalse: [ "."
				(elementSize = 2 and: [ (aString at: elementStart) = $.  and: [ (aString at: elementStart + 1) = $. ] ]) ".."
					ifTrue: [
						index := index - 1.
						"should we signal a syntax error if the path is empty?"
						p isEmpty ifFalse: [
							p removeLast ] ]
					ifFalse: [
						| semiColonIndex |
						index := index + 1.
						semiColonIndex := aString indexOf: $; startingAt: elementStart.
						(semiColonIndex > 0 and: [ semiColonIndex < elementEnd ])
							ifTrue: [			
								p addLast: (self class decodePercent: aString from: elementStart to: semiColonIndex).
								self parsePathParameters: aString at: index from: semiColonIndex + 1 to: elementEnd ]
							ifFalse: [
								p addLast: (self class decodePercent: aString from: elementStart to: elementEnd) ] ] ] ].
		elementStart := elementEnd + 1.
		[ elementStart < end and: [ (aString at: elementStart) = $/ ] ] whileTrue: [
			elementStart := elementStart + 1 ] ].
	
	slash := (end - start) > 0 and: [ (aString at: end - 1) = $/ ]
]

{ #category : 'parsing' }
WAUrl >> parsePathParameters: aString at: anIndex from: start to: end [
	| parameterStart |
	parameterStart := start.
	[ parameterStart > 0 and: [ parameterStart < end ] ] whileTrue: [
		| nameEnd parameterEnd |
		nameEnd := aString indexOf: $= startingAt: parameterStart.
		parameterEnd := aString indexOf: $; startingAt: parameterStart.
		parameterEnd := parameterEnd > 0
			ifTrue: [ parameterEnd min: end ]
			ifFalse: [ end ].
		(nameEnd > 0 and: [ nameEnd < end ])
			ifTrue: [
				| parameterName valueStart |
				parameterName := self class decodePercent: aString from: parameterStart to: nameEnd.
				valueStart := nameEnd + 1.
				[ valueStart > 0 and: [ valueStart < parameterEnd ] ] whileTrue: [
					| valueEnd |
					valueEnd := aString indexOf: $, startingAt: valueStart + 1.
					valueEnd := valueEnd > 0
						ifTrue: [ valueEnd min: parameterEnd ]
						ifFalse: [ parameterEnd ].
					self
						addPathParameterAt: anIndex 
						key: parameterName
						value: (self class decodePercent: aString from: valueStart to: valueEnd).
					valueStart := valueEnd + 1 ] ]
			ifFalse: [
				self addPathParameterAt: anIndex key: (self class decodePercent: aString from: parameterStart to: parameterEnd) ].
		parameterStart := parameterEnd + 1 ]
]

{ #category : 'parsing' }
WAUrl >> parsePort: aString from: start to: end [
	| number |
	number := nil.
	start to: end - 1 do: [ :i |
		| char |
		char := aString at: i.
		(char < $0 or: [ char > $9 ]) ifTrue: [
			WAInvalidUrlSyntaxError signal: aString ].
		number := (number isNil  ifTrue: [ 0 ] ifFalse: [ 10 * number ])
			+ (char greaseInteger - $0 greaseInteger) ].
	^ number
]

{ #category : 'parsing' }
WAUrl >> parseQuery: aString from: queryStart to: queryEnd [
	| parameterStart |
	parameterStart := queryStart.
	[ parameterStart > 0 and: [ parameterStart < queryEnd ] ] whileTrue: [
		| nameEnd parameterEnd |
		nameEnd := aString indexOf: $= startingAt: parameterStart.
		parameterEnd := aString indexOf: $& startingAt: parameterStart.
		parameterEnd := parameterEnd > 0
			ifTrue: [ parameterEnd min: queryEnd ]
			ifFalse: [ queryEnd ].
		(nameEnd > 0 and: [ nameEnd < parameterEnd ])
			ifTrue: [
				self
					addField: (self class decodePercentAndPlus: aString from: parameterStart to: nameEnd)
					value: (self class decodePercentAndPlus: aString from: nameEnd + 1 to: parameterEnd) ]
			ifFalse: [
				self addField: (self class decodePercentAndPlus: aString from: parameterStart to: parameterEnd) ].
		parameterStart := parameterEnd + 1 ]
]

{ #category : 'parsing' }
WAUrl >> parseUserPassword: aString from: start to: end [
	| colonIndex |
	colonIndex := aString indexOf: $: startingAt: start.
	(colonIndex > 0 and: [ colonIndex < end ])
		ifTrue: [
			self user: (self class decodePercent: aString from: start to: colonIndex).
			self password: (self class decodePercent: aString from: colonIndex + 1 to: end) ]
		ifFalse: [
			self user: (self class decodePercent: aString from: start to: end) ]
]

{ #category : 'accessing' }
WAUrl >> password [
	"Answer the password part of the URL userinfo. Note that the use of the format
	'user:password' for userinfo has been deprecated in RFC 3986 (3.2.1)."

	^ password
]

{ #category : 'accessing' }
WAUrl >> password: aString [
	password := aString
]

{ #category : 'accessing' }
WAUrl >> path [
	"Answer the path part of the URL."

	^ path ifNil: [ path := OrderedCollection new: 5 ]
]

{ #category : 'accessing' }
WAUrl >> path: aCollection [
	"Set the path part of the URL to aCollection."

	path := aCollection
]

{ #category : 'private' }
WAUrl >> pathElementsIn: aString do: aOneArgumentBlock [
	GRPlatform
		subStringsIn: aString
		splitBy: $/
		do: aOneArgumentBlock
]

{ #category : 'converting' }
WAUrl >> pathEncodedWith: aCodec on: aStream [
	| document |
	document := WAUnescapedDocument 
		on: aStream
		codec: aCodec.
	self encodePathOn: document
]

{ #category : 'accessing' }
WAUrl >> pathParameterAllAt: anIndex key: aKey ifAbsent: aZeroArgumentBlock [
	"Answer all the parameters at path index anIndex with key aKey evaluation aZeroArgumentBlock if none is found."
	^ self
		privatePathParameterMapAt: anIndex
		ifPresentDo: [ :parameters |
			parameters allAt: aKey ifAbsent: aZeroArgumentBlock ]
		ifAbsent: aZeroArgumentBlock
]

{ #category : 'accessing' }
WAUrl >> pathParameterAt: anIndex key: aKey ifAbsent: aZeroArgumentBlock [
	"Answer the first parameter at path index anIndex with key aKey evaluation aZeroArgumentBlock if none is found."
	^ self
		privatePathParameterMapAt: anIndex
		ifPresentDo: [ :parameters |
			parameters at: aKey ifAbsent: aZeroArgumentBlock ]
		ifAbsent: aZeroArgumentBlock
]

{ #category : 'converting' }
WAUrl >> pathStringEncodedWith: aCodec [
	| size |
	"estimate the buffer size"
	size := (self pathStringUnencodedSize * 1.1) greaseInteger.
	^ String new: size streamContents: [ :stream |
		self pathEncodedWith: aCodec on: stream ]
]

{ #category : 'converting' }
WAUrl >> pathStringSafeUnencoded [
	"Answer the path converted to a string without doing URL or HTML escaping.
	Compared to #pathStringUnencoded, we cannot guarantee to not copy here.
	"
	| stream |
	stream := WriteStream on: (String new: self pathStringUnencodedSize).
	self pathUnencodedOn: stream.
	^ stream contents
]

{ #category : 'converting' }
WAUrl >> pathStringUnencoded [
	"Answer the path converted to a string without doing URL or HTML escaping."

	"allocate with correct size, avoid copy"
	| string stream commonElementClass |
	commonElementClass := self detectCommonPathElementClass.
	commonElementClass isNil ifTrue: [
		^ self pathStringSafeUnencoded ].
	string := commonElementClass new: self pathStringUnencodedSize.
	stream := WriteStream on: string.
	self pathUnencodedOn: stream.
	^ string
]

{ #category : 'private' }
WAUrl >> pathStringUnencodedSize [
	| count |
	count := 0.
	path isNil ifFalse: [
		path do: [ :each |
			count := count + each size + 1 ] ].
	(path isNil or: [ path isEmpty or: [ slash ] ])
		ifTrue: [ count := count + 1 ].
	^ count
]

{ #category : 'converting' }
WAUrl >> pathUnencodedOn: aStream [
	"Print the path on on the given stream without doing URL or HTML escaping."

	path isNil ifFalse: [
		path do: [ :each |
			aStream nextPut: $/.
			aStream nextPutAll: each ] ].
	(path isNil or: [ path isEmpty or: [ slash ] ])
		ifTrue: [ aStream nextPut: $/ ]
]

{ #category : 'accessing' }
WAUrl >> port [
	"Answer the port number part of the URL."

	^ port
]

{ #category : 'accessing' }
WAUrl >> port: aNumber [
	port := aNumber
]

{ #category : 'copying' }
WAUrl >> postCopy [
	super postCopy.
	path := path ifNotNil: [ :p | p copy ].
	queryFields := queryFields ifNotNil: [ :f | f copy ].
	pathParameters := pathParameters ifNotNil: [ :p | p copy ]
]

{ #category : 'printing' }
WAUrl >> printOn: aStream [ 
	| document codec |
	codec := [ self requestContext codec ] 
		on: WARequestContextNotFound
		do: [ :e | GRNullCodec new ].
	document := WAUnescapedDocument 
		on: aStream
		codec: codec.
	self encodeOn: document
]

{ #category : 'private' }
WAUrl >> privatePathParameterMapAt: anIndex [
	pathParameters isNil ifTrue: [
		pathParameters := OrderedCollection new: self path size ].
	^ pathParameters size >= anIndex
		ifTrue: [ pathParameters at: anIndex ]
		ifFalse: [
			anIndex - pathParameters size - 1 timesRepeat: [
				pathParameters add: nil ].
			pathParameters add: GROrderedMultiMap2 new ]
]

{ #category : 'private' }
WAUrl >> privatePathParameterMapAt: anIndex ifPresentDo: aOneArgumentBlock ifAbsent: aZeroArgumentBlock [
	| parameters |
	pathParameters isNil ifTrue: [
		^ aZeroArgumentBlock value ].
	parameters := pathParameters at: anIndex ifAbsent: [
		^ aZeroArgumentBlock value ].
	parameters isNil ifTrue: [
		^ aZeroArgumentBlock value ].
	^ aOneArgumentBlock value: parameters
]

{ #category : 'accessing' }
WAUrl >> queryFields [
	"Answer a dictionary with the query fields."
	^ queryFields ifNil: [ queryFields := WARequestFields new ]
]

{ #category : 'accessing' }
WAUrl >> queryFields: aDictionary [
	queryFields := aDictionary
]

{ #category : 'converting' }
WAUrl >> queryString [
	"Answer the full query part of the URL. It would probably be better to
	store this as a string somewhere so we can support queries that are not
	key/value field lists."
	
	^ String streamContents: [ :stream |
		| urlEncoder |
		urlEncoder := GRPlatform current urlEncoderOn: stream.
		self queryFields associations
			do: [ :each |
				urlEncoder nextPutAll: each key.
				each value notNil ifTrue: [
					stream nextPut: $=.
					urlEncoder nextPutAll: each value greaseString ] ]
			separatedBy: [ stream nextPut: $& ] ]
]

{ #category : 'adding' }
WAUrl >> rawAddAllToPath: aCollectionOfStrings [
	"Add a collection of strings to the path. If an element contains $/ it is not split into multiple elements."
	
	aCollectionOfStrings do: [ :each | self rawAddToPath: each ]
]

{ #category : 'adding' }
WAUrl >> rawAddToPath: aString [
	"Adds the argument as a path element. If the argument contains $/ it is not split into multiple elements."

	self path add: aString
]

{ #category : 'converting' }
WAUrl >> relativeTo: aUrl [
	"Answer a path element collection relative from the receiver to aUrl."
	
	| currentPath argumentPath resultingPath |
	currentPath := self path copy.
	argumentPath := aUrl path copy.
	[ currentPath notEmpty and: [ argumentPath notEmpty and: [ currentPath first = argumentPath first ] ] ] whileTrue: [
		currentPath removeFirst.
		argumentPath removeFirst ].
	resultingPath := OrderedCollection new.
	currentPath size 
		timesRepeat: [ resultingPath add: '..' ].
	resultingPath addAll: argumentPath.
	^ resultingPath
]

{ #category : 'accessing' }
WAUrl >> scheme [
	"Answer the URL's scheme."

	^ scheme ifNil: [ 'http' ]
]

{ #category : 'accessing' }
WAUrl >> scheme: aString [
	scheme := aString isNil ifFalse: [ aString asLowercase ]
]

{ #category : 'converting' }
WAUrl >> seasideUrl [
	^ self
]

{ #category : 'accessing' }
WAUrl >> slash [
	"Answer if the path has a trailing slash."

	^ slash
]

{ #category : 'accessing' }
WAUrl >> slash: aBoolean [
	slash := aBoolean
]

{ #category : 'private' }
WAUrl >> takeServerParametersFromRequest: aRequest [
	"Retrieves scheme, hostname and basepath from the request unless already set."

	scheme isNil
		ifTrue: [ self scheme: aRequest url scheme ].
	host isNil 
		ifTrue: [ aRequest headers at: 'host' ifPresent: [ :value | self parseAuthority: value from: 1 to: value size + 1 ] ].
	path isNil
		ifTrue: [ aRequest headers at: 'base' ifPresent: [ :value | self parsePath: value ] ]
]

{ #category : 'accessing' }
WAUrl >> user [
	"Answer the user part of the URL userinfo. Note that the use of the format
	'user:password' for userinfo has been deprecated in RFC 3986 (3.2.1)."

	^ user
]

{ #category : 'accessing' }
WAUrl >> user: aString [
	user := aString
]

{ #category : 'accessing' }
WAUrl >> userinfo [
	"Answer the userinfo part of the URL. We store user and password separately,
	even though the format 'user:password' is deprecated for userinfo in RFC 3986,
	because otherwise it is impossible to figure out correct encoding when userinfo
	data has a colon in it."

	^ password isNil
		ifTrue: [ user ]
		ifFalse: [ String streamContents: [ :stream |
			stream
				nextPutAll: user;
				nextPut: $:;
				nextPutAll: password ] ]
]

{ #category : 'accessing' }
WAUrl >> userinfo: aString [
	"Colons in userinfo must be encoded. The only exception (now deprecated by RFC 3986)
	is a single colon separating a password from the rest of the user information. Since
	we can't tell the difference here, we assume that any colons should be encoded. If
	you want to specify a (deprecated) password, use #user: and #password:."
	
	user := aString.
	password := nil
]

{ #category : 'copying' }
WAUrl >> with: pathString [
	^ self copy
		addToPath: pathString;
		yourself
]

{ #category : 'copying' }
WAUrl >> withField: aString [
	^ self copy
		addField: aString;
		yourself
]

{ #category : 'copying' }
WAUrl >> withField: aString value: valueString [
	^ self copy
		addField: aString value: valueString;
		yourself
]

{ #category : 'copying' }
WAUrl >> withoutFragment [
	^ self copy
		fragment: nil;
		yourself
]

{ #category : 'copying' }
WAUrl >> withoutQuery [
	^ self copy
		queryFields: nil;
		yourself
]

{ #category : 'copying' }
WAUrl >> withoutResource [

	^ self copy
		  path: OrderedCollection new;
		  queryFields: nil;
		  fragment: nil;
		  yourself
]

{ #category : 'copying' }
WAUrl >> withoutSeasideQueryFields [

	"Returns a copy of receiver without Seaside query fields (which are prefixed with `_`)"

	| newUrl |
	newUrl := self copy.
	(self queryFields keys select: [ :f | self isSeasideField: f ]) 
		do: [ :f | newUrl queryFields removeKey: f ifAbsent: [  ] ].
	^ newUrl
]
