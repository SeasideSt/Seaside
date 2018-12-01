Class {
	#name : #WAFastCGIRequestConverter,
	#superclass : #WAServerAdaptor,
	#instVars : [
		'server'
	],
	#category : 'Seaside-Adaptors-FastCGI'
}

{ #category : #private }
WAFastCGIRequestConverter >> decodeFields: aDictionary using: aOneArgumentBlock into: aRequestFields [
	aDictionary keysAndValuesDo: [ :key :value |
		(value isString)
			ifTrue: [ aRequestFields at: key add:  (aOneArgumentBlock value: value) ]
			ifFalse: [
				(value isCollection)
					ifTrue: [ value collect: [ :string |
						aRequestFields at: key add:  (aOneArgumentBlock value: string) ] ]
					ifFalse: [ aRequestFields at: key add: value ]]]
]

{ #category : #private }
WAFastCGIRequestConverter >> fieldsFromBody: aFSResponderRole [

	^(self isUrlEncoded: aFSResponderRole)
		ifTrue: [ aFSResponderRole stdin asString ]
		ifFalse: [ '' ].
]

{ #category : #private }
WAFastCGIRequestConverter >> fieldsFromURI: aFSResponderRole [

	| string i |
	string := aFSResponderRole params at: 'REQUEST_URI'.
	i := string 
		indexOf: $?
		startingAt: 1
		ifAbsent: [^''].
	string := string copyFrom: i + 1 to: string size.
	^string.
]

{ #category : #private }
WAFastCGIRequestConverter >> getFieldsOf: aFSResponderRole into: aRequestFields [
	"puts all the GET parameters of the given request decoded into a dictionary merger"
	^self
		decodeFields: (self parseFields: aFSResponderRole)
		using: [ :each | self codec url decode: each ]
		into: aRequestFields
]

{ #category : #testing }
WAFastCGIRequestConverter >> isLogging [
	^ FSLog enabled
]

{ #category : #private }
WAFastCGIRequestConverter >> isUrlEncoded: aFSResponderRole [
	"answers whether the body of the given request is url encoded"
	
	^(aFSResponderRole params 
		at: 'CONTENT_TYPE' 
		ifAbsent: ['']) beginsWith: 'application/x-www-form-urlencoded'
]

{ #category : #private }
WAFastCGIRequestConverter >> multipartFormFieldsIn: aFSResponderRole do: aBlock [

	| contentType bounds idx contentLength body values boundary stream part |
	contentType := aFSResponderRole params at: 'CONTENT_TYPE' ifAbsent: [''].
	contentLength := aFSResponderRole params  at: 'CONTENT_LENGTH' ifAbsent: ['0'].
	body := aFSResponderRole stdin asString.
	contentLength asNumber = body size ifFalse: [
		self error: 'Expected size: ' , contentLength , '; actual size: ' , body size printString.
	].
	bounds := 'boundary='.
	idx := contentType indexOfSubCollection: bounds.
	boundary := '--' , (contentType copyFrom: idx + bounds size to: contentType size).
	stream := ReadStream on: body.
	(part := stream next: boundary size) = boundary 
		ifFalse: [ self error: 'Expected: ' , boundary , ' Received: ' , part printString ].
	[ stream atEnd not ] whileTrue: [
		part := stream upToAll: boundary.
		(part size <= 4 and: [part beginsWith: '--']) 
			ifFalse: [
				part := self unwrapPart: part.
				part ~~ nil 
					ifTrue: [ aBlock value: part ].
				stream next: boundary size]].
]

{ #category : #private }
WAFastCGIRequestConverter >> parseFields: aFSResponderRole [

	| fields |
	fields := WARequestFields new.
	{ 	"self fieldsFromURI:  aFSResponderRole."
		((aFSResponderRole params at: 'REQUEST_METHOD') = 'POST')
			ifTrue: [  self fieldsFromBody:  aFSResponderRole  ]
			ifFalse: [ '' ]. } do: [:string |
		(string subStrings: $&) do: [:each | 
			| pair |
			pair := each subStrings: $=.
			fields
				at: (self percentDecode: pair first)
				add: (pair size = 1 ifTrue: [ '' ] ifFalse: [ self percentDecode: (pair at: 2) ]) ]].
	^fields
]

{ #category : #private }
WAFastCGIRequestConverter >> percentDecode: aString [

	| results input space |
	input := ReadStream on: aString.
	results := WriteStream on: String new.
	space := Character space.
	[ input atEnd ] whileFalse: 
		[ | char |
		char := input next asCharacter.
		results nextPut: (char = $+ 
			ifTrue: [ space ]
			ifFalse: 
				[char == $% 
					ifTrue: [ 
						[ Character codePoint: input next asUppercase digitValue * 16
							+ input next asUppercase digitValue ] 
							on: Error 
							do: [:ex | Character codePoint: 0 ]]
					ifFalse: [ char ]]) ].
	^results contents
]

{ #category : #private }
WAFastCGIRequestConverter >> postFieldsOf: aNativeRequest into: aDictionaryMerger [
	"puts all the POST parameters of the given request decoded into a dictionary merger"
	| isUrlEncoded |
	isUrlEncoded := self isUrlEncoded: aNativeRequest.
	^self
		decodeFields: (aNativeRequest params at: 'postFields' ifAbsent: [ Dictionary new ])
		using: [ :each |
			isUrlEncoded 
				ifTrue: [ self codec url decode: each ]
				ifFalse: [ self codec decode: each ] ]
		into: aDictionaryMerger
]

{ #category : #private }
WAFastCGIRequestConverter >> processMultipartFields: aFSResponderRole [
	| fields |
	fields := WARequestFields new.	
	self multipartFormFieldsIn: aFSResponderRole do: [:part |  fields at: part key add: part value ].
	
	"ugly"
	aFSResponderRole params at: 'postFields' put: fields
]

{ #category : #'converting-request' }
WAFastCGIRequestConverter >> requestAddressFor: aFSResponderRole [

	^aFSResponderRole params  at: 'REMOTE_ADDR'
]

{ #category : #'converting-request' }
WAFastCGIRequestConverter >> requestBodyFor: aFSResponderRole [

	^aFSResponderRole stdin asString
]

{ #category : #'converting-request' }
WAFastCGIRequestConverter >> requestCookiesFor: aFSResponderRole [

	^ WARequestCookie 
		fromString: (aFSResponderRole params at: 'HTTP_COOKIE' ifAbsent: [ nil ]) 
		codec: self codec
]

{ #category : #'converting-request' }
WAFastCGIRequestConverter >> requestFieldsFor: aNativeRequest [
	| fields |
	fields := WARequestFields new.
	self getFieldsOf: aNativeRequest into: fields.
	((aNativeRequest params at: 'REQUEST_METHOD') = 'POST')
		ifTrue: [ self postFieldsOf: aNativeRequest into: fields ].
	^ fields
]

{ #category : #converting }
WAFastCGIRequestConverter >> requestFor: aFSResponderRole [

	| request |
	((aFSResponderRole params at: 'REQUEST_METHOD') = 'POST' 
		and: [(aFSResponderRole params at: 'CONTENT_TYPE' ifAbsent: ['']) beginsWith: MIMEDocument contentTypeMultipart ] )
		ifTrue: [ self processMultipartFields: aFSResponderRole ].
	request := super requestFor: aFSResponderRole.
	self isLogging ifTrue: [ (ObjectLogEntry info: 'Request' object: { request copy. aFSResponderRole. }) addToLog ].
	^request
]

{ #category : #'converting-request' }
WAFastCGIRequestConverter >> requestHeadersFor: aNativeRequest [

	| params keys values |
	values := Dictionary new.
	params := aNativeRequest params.
	keys := params keys do: [:each | 
		(each ~= 'HTTP_COOKIE' and: [each beginsWith: 'HTTP_'])
			ifTrue: [
				values
					at: ((each copyFrom: 6 to: each size) asLowercase copyReplaceAll: '_' with: '-')
					put: (params at: each).
				(each beginsWith: 'HTTP_X_FORWARDED_')
					ifTrue: [ 
						values
							at: (each copyFrom: 18 to: each size) asLowercase
							put: (params at: each)].
			]
			ifFalse: [
				each asLowercase = 'authorization'
					ifTrue: [
						values
							at: 'authorization'
							put: (params at: each).
					]
			].
	].
	^values
]

{ #category : #'converting-request' }
WAFastCGIRequestConverter >> requestMethodFor: aNativeRequest [

	^aNativeRequest params at: 'REQUEST_METHOD'
]

{ #category : #'converting-request' }
WAFastCGIRequestConverter >> requestUrlFor: aNativeRequest [

	^ (WAUrl absolute: ( aNativeRequest params at: 'REQUEST_URI')) 
		decodedWith: self codec
]

{ #category : #'converting-request' }
WAFastCGIRequestConverter >> requestVersionFor: aNativeRequest [

	^ WAHttpVersion fromString: (aNativeRequest params at: 'SERVER_PROTOCOL')
]

{ #category : #private }
WAFastCGIRequestConverter >> unwrapPart: aString [

	| crlf i j name filename contentType data waFile |
	crlf := Character cr asString , Character lf asString.
	((aString copyFrom: 1 to: 2) = crlf
		and: [(aString copyFrom: 3 to: 40) = 'Content-Disposition: form-data; name="'])
		ifFalse: [
			self error: 'Unexpected multipart data (1): ' , aString printString.
	].
	i := aString indexOf: $" startingAt: 41.
	name := aString copyFrom: 41 to: i - 1.
	((aString copyFrom: i + 1 to: i + 4) = (crlf , crlf) 
		and: [(aString copyFrom: aString size - 1 to: aString size) = crlf]) ifTrue: [
			data := aString copyFrom: i + 5 to: aString size - 2.
			^name -> data.
	].
	((aString copyFrom: i to: i + 12) = '"; filename="' 
		and: [(aString copyFrom: aString size - 1 to: aString size) = crlf]) ifTrue: [ | tokens type subTypes |
			j := aString indexOf: $" startingAt: i + 13.
			filename := self codec url decode: (aString copyFrom: i + 13 to: j - 1).
			filename isEmpty ifTrue: [ ^nil ]. "bug39828"
			((aString copyFrom: j + 1 to: j + 16) = (crlf , 'Content-Type: ') 
				and: [(aString copyFrom: aString size - 1 to: aString size) = crlf]) ifFalse: [
				self error: 'Unexpected multipart data (2): ' , aString printString.
			].
			i := j + 17.
			j := aString indexOf: Character cr startingAt: i.
			contentType := aString copyFrom: i to: j - 1.
			(aString copyFrom: j to: j + 3) = (crlf , crlf) ifFalse: [
				self error: 'Unexpected multipart data (3): ' , aString printString.
			].
			data := aString copyFrom: j + 4 to: aString size - 2.
			tokens := contentType findTokens: '/'.
			type := tokens first.
			subTypes := tokens second findTokens: '+'.
			waFile := WAFile new
				contents: data asByteArray;
				contentType: contentType;
				fileName: filename;
				yourself.
			^name -> waFile.
	].
	self error: 'Unexpected multipart data (4): ' , aString printString.
]
