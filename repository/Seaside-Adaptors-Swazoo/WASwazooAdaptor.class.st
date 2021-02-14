Class {
	#name : #WASwazooAdaptor,
	#superclass : #WAServerAdaptor,
	#instVars : [
		'site'
	],
	#category : 'Seaside-Adaptors-Swazoo'
}

{ #category : #testing }
WASwazooAdaptor class >> isAbstract [
	^ self name = #WABaseServerAdaptor
]

{ #category : #actions }
WASwazooAdaptor class >> resetAll [
	"removes all Seaside sites, run this if you run into trouble creating servers"
	| server toRemove |
	server := SwazooServer singleton.
	toRemove := server allSites select: [ :each |
		each isKindOf: WAPluggableSite ].
	toRemove do: [ :each |
		server removeSite: each ]
]

{ #category : #private }
WASwazooAdaptor >> basicStart [
	site port: self port.
	SwazooServer singleton addSite: site.
	site start
]

{ #category : #private }
WASwazooAdaptor >> basicStop [
	SwazooServer singleton removeSite: site
]

{ #category : #private }
WASwazooAdaptor >> convertCookiesFrom: aWAResponse to: aSwazooResponse [
	| cookies setCookieField |
	cookies := aWAResponse cookies.
	cookies isEmpty ifTrue: [ ^ self ].
	
	setCookieField := WorkingHTTPSetCookieField new.

	cookies do: [ :each |
		setCookieField addCookie: each rfc6265String ].
	
	aSwazooResponse headers addField: setCookieField
]

{ #category : #initialization }
WASwazooAdaptor >> initialize [
	super initialize.
	site := WAPluggableSite
		named: (WAKeyGenerator current keyOfLength: 32)
		on: self.
	site ip: '*'.
	site host: '*'
]

{ #category : #testing }
WASwazooAdaptor >> isRunning [
	^ site isServing
]

{ #category : #testing }
WASwazooAdaptor >> isStarting [
	^ false
]

{ #category : #testing }
WASwazooAdaptor >> isStopped [
	^ site isServing not
]

{ #category : #testing }
WASwazooAdaptor >> isStopping [
	^ false
]

{ #category : #private }
WASwazooAdaptor >> postFieldsOf: aNativeRequest into: aRequestFields [
	"break encapsulation - This line is likely unnecessary because #requestBodyFor:
		will have already done this after extracting the body."
	aNativeRequest ensureFullRead. ""
	aNativeRequest postData keysAndValuesDo: [ :key :value |
		| data |
		data := value filename isEmptyOrNil
			ifTrue: [ self codec url decode: value value ]
			ifFalse: [
				| isoCodec |
				isoCodec := GRCodec forEncoding: 'ISO-8859-1'.
				WAFile new
					fileName: (self codec url decode: value filename);
					contentType: value contentType seasideMimeType;
					"does a 1:1 mapping from character values to bytes"
					contents: (isoCodec encode: value value) asByteArray;
					yourself ].
		aRequestFields at: key add: data ]
]

{ #category : #'converting-request' }
WASwazooAdaptor >> requestAddressFor: aNativeRequest [
	"converts a Squeak address (ByteArray) to an IPv4 String"
	| remoteAddress |
	remoteAddress := aNativeRequest peer.
	remoteAddress isString ifTrue: [
		"so apparently someone has a new VM with IPv6 support"
		^ remoteAddress ].
	
	^ String streamContents: [ :stream |
		remoteAddress
			do: [ :each | stream print: each ]
			separatedBy: [ stream nextPut: $. ] ]
]

{ #category : #'converting-request' }
WASwazooAdaptor >> requestBodyFor: aNativeRequest [
	"This only works for POST and PUT requests... LAME!"

	aNativeRequest isPost ifTrue: [
		| body |
		"Nasty nastiness but we need to get the raw body before Swazoo parses
		the POST data. Then we need to manually reinject the data to allow it to
		be parsed (since the data has already been pulled off the socket)."
		body := aNativeRequest postData stream nextBytes: aNativeRequest contentLength.
		aNativeRequest parsePostDataFrom: (SwazooStream on: body).
		aNativeRequest postData setParsed.
		^ body ].
	aNativeRequest isPut
		ifTrue: [ ^ aNativeRequest putData ].
	^ nil
]

{ #category : #'converting-request' }
WASwazooAdaptor >> requestCookiesFor: aNativeRequest [
	^ WARequestCookie fromString: aNativeRequest cookie codec: self codec
]

{ #category : #'converting-request' }
WASwazooAdaptor >> requestFieldsFor: aNativeRequest [
	| fields |
	fields := WARequestFields new.
	aNativeRequest isPost
		ifTrue: [ self postFieldsOf: aNativeRequest into: fields ].
	^ fields
]

{ #category : #'converting-request' }
WASwazooAdaptor >> requestHeadersFor: aNativeRequest [
	| swazooFields fields |
	swazooFields := aNativeRequest headers fields.
	fields := Dictionary new: swazooFields size.
	swazooFields keysAndValuesDo: [ :key :field |
		| value |
		value := String streamContents: [ :stream |
			field valuesAsStringOn: stream ].
		fields at: key asLowercase put: value ].
	^ fields
]

{ #category : #'converting-request' }
WASwazooAdaptor >> requestMethodFor: aNativeRequest [
	^ aNativeRequest methodName
]

{ #category : #'converting-request' }
WASwazooAdaptor >> requestUrlFor: aNativeRequest [
	| swazooUri seasideUrl |
	seasideUrl := WAUrl new.
	swazooUri := aNativeRequest uri.
	swazooUri identifierPath do: [ :each |
		"the first path element seems to always be '/'"
		each = '/' ifFalse: [
			seasideUrl addToPath: each ] ].
	swazooUri queries do: [ :each |
		| value |
		value := each value.
		"non-existing values are implemented as ''"
		value isEmpty
			ifTrue: [ seasideUrl addField: each key ]
			ifFalse: [ seasideUrl addField: each key value: value ] ].
	seasideUrl slash: swazooUri isDirectory.

	aNativeRequest isEncrypted
		ifTrue: [ seasideUrl scheme: 'https' ].
		
	^ seasideUrl decodedWith: self codec
]

{ #category : #'converting-request' }
WASwazooAdaptor >> requestVersionFor: aNativeRequest [
	| array |
	array := aNativeRequest httpVersion.
	^ WAHttpVersion major: array first minor: array second
]

{ #category : #converting }
WASwazooAdaptor >> responseFrom: aRequestContext [ 
	| swazooResponse |
	swazooResponse := HTTPResponse new.
	aRequestContext response headers keysAndValuesDo: [ :key :value | 
		key = 'Content-Type' 
			ifTrue: [ swazooResponse contentType: value greaseString ]
			ifFalse: [
				| field fieldClass |
				fieldClass := HeaderField classForFieldName: key.
				field := fieldClass 
					newForFieldName: key
					withValueFrom: value greaseString.
				swazooResponse headers addField: field ] ].
	self 
		convertCookiesFrom: aRequestContext response
		to: swazooResponse.
	swazooResponse code: aRequestContext response status asNumber.
	swazooResponse entity: aRequestContext response contents.
	^ swazooResponse
]

{ #category : #private }
WASwazooAdaptor >> shutDown [
	SwazooServer stop
]

{ #category : #private }
WASwazooAdaptor >> startUp [
	SwazooServer start
]
