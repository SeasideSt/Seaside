"
I am a server independent http request object. Instance of me can be aquired through WAObject >> #currentRequest.

Instance Variables
	method:			<String>
	uri:					<WAUrl>
	version:				<WAHttpVersion>
	remoteAddress:	<String>
	headers:			<Dictionary<String, String>>
	cookies:			<Collection<WARequestCookie>>
	body:				<String>
	postFields:			<WARequestFields>
	sslSessionId:		<String>
			
method
	- the HTTP method, should be upper case. In general only 'GET' and 'POST' are encountered in Seaside. SqueakSource also supports 'PUT'.		

uri
	- The request url without parameters. For example if the client requested 'http://www.google.com/search?q=seaside' then the contents of url would be '/search'. To get the parameters use #fields. This url is fully decoded. Use the #host method to get the host name. Dependening on the server adapter the #scheme may be 'http' or 'https' if the original request was HTTPS.
	
version
	- The version of this request.
	
remoteAddress
	- The IP address of the client. If the server is behind a reverse proxy then this is '127.0.0.1'. This could in theory also be an IPv6 address.

headers
	- The header of the HTTP request. This is a Dictionary mapping lowercase strings to other strings.
	
cookies
	- The collection of cookies (instance of WARequestCookie) the client sent. Note not all clients support all fields. E.g. you might send a path but the client might not return it. Note there can be several cookies with the same key but a different domain or path. See the #cookiesAt: method.
	
body
	- The undecoded, raw request body as a String, may be nil. See the ""accessing-body"" protocol for accessing it.
	
postFields
	- The HTTP POST request parameters. In general this is a dictionary mapping Strings to Strings. In the case of multivalued paramters multiple mappings may exist.
	
sslSessionId
	- The SSL session id. This is an opaque string. It is not present if the request wasn't made over SSL (or TLS) or the server adaptor does not support this feature.
"
Class {
	#name : #WARequest,
	#superclass : #WAObject,
	#instVars : [
		'method',
		'uri',
		'version',
		'remoteAddress',
		'headers',
		'cookies',
		'body',
		'postFields',
		'sslSessionId'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #configuration }
WARequest class >> defaultMethod [
	^ 'GET'
]

{ #category : #configuration }
WARequest class >> defaultUri [
	^ '/' seasideUrl
]

{ #category : #configuration }
WARequest class >> defaultVersion [
	^ WAHttpVersion http11
]

{ #category : #'instance creation' }
WARequest class >> method: methodString uri: aUrlOrString [
	^ self method: methodString uri: aUrlOrString version: self defaultVersion
]

{ #category : #'instance creation' }
WARequest class >> method: methodString uri: aUrlOrString version: aVersion [
	^ self basicNew
		initializeWithMethod: methodString
			uri: aUrlOrString
			version: aVersion;
		yourself
]

{ #category : #'instance creation' }
WARequest class >> new [
	^ self
		method: self defaultMethod
		uri: self defaultUri
		version: self defaultVersion
]

{ #category : #'accessing-headers' }
WARequest >> accept [
	"The Accept request-header field can be used to specify certain media types which are acceptable for the response. Accept headers can be used to indicate that the request is specifically limited to a small set of desired types, as in the case of a request for an in-line image.
	
	Answers an OrderedCollection of WAAccept with the values in the order the client sent them."

	^ WAAccept fromString: (self headerAt: 'accept' ifAbsent: [ ^ nil ])
]

{ #category : #'accessing-headers' }
WARequest >> acceptCharset [
	"The Accept-Charset request-header field can be used to indicate what character sets are acceptable for the response. This field allows clients capable of understanding more comprehensive or special- purpose character sets to signal that capability to a server which is capable of representing documents in those character sets.
	
	Answers an OrderedCollection of WAAcceptCharset with the values in the order the client sent them."

	^ WAAcceptCharset fromString: (self headerAt: 'accept-charset' ifAbsent: [ ^ nil ])
]

{ #category : #'accessing-headers' }
WARequest >> acceptEncoding [
	"The Accept-Encoding request-header field is similar to Accept, but restricts the content-codings (section 3.5) that are acceptable in the response.
	
	Answers an OrderedCollection of WAAcceptEncoding with the values in the order the client sent them."

	^ WAAcceptEncoding fromString: (self headerAt: 'accept-encoding' ifAbsent: [ ^ nil ])
]

{ #category : #'accessing-headers' }
WARequest >> acceptLanguage [
	"The Accept-Language request-header field is similar to Accept, but restricts the set of natural languages that are preferred as a response to the request.
	
	Answers an OrderedCollection of WAAcceptLanguage with the values in the order the client sent them."

	^ WAAcceptLanguage fromString: (self headerAt: 'accept-language' ifAbsent: [ ^ nil ])
]

{ #category : #accessing }
WARequest >> at: key [
	^ self fields at: key
]

{ #category : #accessing }
WARequest >> at: key ifAbsent: aBlock [
	^ self fields at: key ifAbsent: aBlock
]

{ #category : #accessing }
WARequest >> at: key ifPresent: aBlock [
	^ self fields at: key ifPresent: aBlock
]

{ #category : #'accessing-headers' }
WARequest >> authorization [
	"Answer the basic authorization string from the request. This is the username and the password separated by a colon."
	
	| authorization |
	authorization := self headerAt: 'authorization'.
	^ authorization isNil ifFalse: [ self decodeAuthorization: authorization ]
]

{ #category : #'accessing-body' }
WARequest >> bodyDecodeUsing: aCharSetName [ 
	"Answer the body decoded using the given character set name. Answer nil if there's no body."
	^ body isNil ifFalse: [ (GRCodec forEncoding: aCharSetName) decode: body ]
]

{ #category : #'accessing-body' }
WARequest >> bodyDecoded [
	"Answer the body decoded using the character set in the request header. Answer nil if no body is present. Signal an error if not character set is present in the request header."
	| contentType charSet |
	contentType := self contentType.
	charSet := contentType isNil ifFalse: [ contentType charSet ].
	^ charSet isNil
		ifTrue: [ WAIllegalStateException signal: 'no character set of request body can not be determined' ]
		ifFalse: [ self bodyDecodeUsing: charSet ]
]

{ #category : #'accessing-headers' }
WARequest >> contentType [
	"The Content-Type entity-header field indicates the media type of the entity-body sent to the recipient or, in the case of the HEAD method, the media type that would have been sent had the request been a GET.
	
	Answer an instance of WAMimeType or nil."
	
	| contentType |
	contentType := self headerAt: 'content-type'.
	^ contentType isNil ifFalse: [ WAMimeType fromString: contentType ]
]

{ #category : #'accessing-cookies' }
WARequest >> cookieAt: aKey [
	"Answer the first found cookie with the given key, there might be several cookies with the name key but different paths, in this case use #cookiesAt:."

	^ self cookies
		detect: [ :each | each key = aKey ]
		ifNone: [ nil ]
]

{ #category : #'accessing-cookies' }
WARequest >> cookies [
	^ cookies ifNil: [ #() ]
]

{ #category : #'accessing-cookies' }
WARequest >> cookiesAt: aKey [
	"Answer all the cookies with the given key."
	
	^ self cookies
		select: [ :each | each key = aKey ]
]

{ #category : #private }
WARequest >> decodeAuthorization: aString [
	| lastSpaceIndex |
	lastSpaceIndex := aString lastIndexOf: $ .
	^ GRPlatform current base64Decode: (lastSpaceIndex = 0
		ifTrue: [ aString ]
		ifFalse: [ aString copyFrom: lastSpaceIndex + 1to: aString size ])
]

{ #category : #initialization }
WARequest >> destroy [
	body := method := uri := version := postFields := remoteAddress := headers := cookies := nil
]

{ #category : #accessing }
WARequest >> fields [
	^ WAMergedRequestFields on: (Array with: self queryFields with: self postFields)
]

{ #category : #accessing }
WARequest >> headerAt: aKey [
	^ self headerAt: aKey ifAbsent: [ nil ]
]

{ #category : #accessing }
WARequest >> headerAt: aKey ifAbsent: aBlock [
	^ headers at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
WARequest >> headers [
	^ headers
]

{ #category : #'accessing-headers' }
WARequest >> host [
	^ self headerAt: 'host'
]

{ #category : #testing }
WARequest >> includesKey: key [
	^ self fields includesKey: key
]

{ #category : #initialization }
WARequest >> initializeWithMethod: methodString uri: aUrlOrString version: aVersion [
	self initialize.
	method := methodString asUppercase.
	uri := aUrlOrString seasideUrl.
	version := aVersion.
	headers := WAHeaderFields new.
	postFields := WARequestFields new.
	cookies := OrderedCollection new.
	remoteAddress := nil
]

{ #category : #testing }
WARequest >> isGet [
	^ self method = 'GET'
]

{ #category : #testing }
WARequest >> isHttp10 [
	^ version isHttp10
]

{ #category : #testing }
WARequest >> isHttp11 [
	^ version isHttp11
]

{ #category : #testing }
WARequest >> isPost [
	^ self method = 'POST'
]

{ #category : #testing }
WARequest >> isPrefetch [
	"Link prefetching is a browser mechanism, which utilizes browser idle time to download or prefetch documents that the user might visit in the near future. When the user visits one of the prefetched documents, it can be served up quickly out of the browser's cache."
	
	^ (self headerAt: 'x-moz') = 'prefetch'
]

{ #category : #testing }
WARequest >> isSsl [
	^ self uri isSsl
]

{ #category : #testing }
WARequest >> isXmlHttpRequest [
	^ (self headerAt: 'x-requested-with') = 'XMLHttpRequest'
]

{ #category : #accessing }
WARequest >> method [
	^ method
]

{ #category : #accessing }
WARequest >> password [
	"Answer the password from basic authentication."
	
	| authorization |
	^ (authorization := self authorization) isNil
		ifFalse: [ authorization copyAfter: $: ]
]

{ #category : #'accessing-body' }
WARequest >> postFields [
	^ postFields
]

{ #category : #printing }
WARequest >> printOn: aStream [ 
	super printOn: aStream.
	aStream
		nextPutAll: ' method: ';
		nextPutAll: self method.
	aStream
		nextPutAll: ' uri: ';
		nextPutAll: self uri greaseString.
	aStream nextPutAll: ' version: '.
	self version printOn: aStream
]

{ #category : #accessing }
WARequest >> queryFields [
	^ self uri queryFields
]

{ #category : #'accessing-body' }
WARequest >> rawBody [
	"Answer the raw, undecoded body. May be nil.
	
	Use #bodyDecoded or #bodyDecodeUsing: to access the decoded contents."

	^ body
]

{ #category : #'accessing-headers' }
WARequest >> referer [
	^ self headerAt: 'referer'
]

{ #category : #accessing }
WARequest >> remoteAddress [
	"answer the IP address of the client (String)"
	^ remoteAddress
]

{ #category : #initialization }
WARequest >> setBody: aString [
	body := aString
]

{ #category : #initialization }
WARequest >> setCookies: cookieCollection [
	cookies := cookieCollection
]

{ #category : #initialization }
WARequest >> setHeaders: headerDictionary [
	headers := headerDictionary
]

{ #category : #initialization }
WARequest >> setPostFields: aRequestFields [
	postFields := aRequestFields seasideRequestFields
]

{ #category : #initialization }
WARequest >> setRemoteAddress: addressString [
	remoteAddress := addressString
]

{ #category : #initialization }
WARequest >> setSslSessionId: anSslSessionIdString [
	sslSessionId := anSslSessionIdString
]

{ #category : #accessing }
WARequest >> sslSessionId [
	"Answer the SSL session id or nil if the request wasn't made over SSL or the server adaptor does not support it (String).
	
	See also #isSsl"
	^ sslSessionId
]

{ #category : #accessing }
WARequest >> uri [
	^ uri
]

{ #category : #accessing }
WARequest >> url [
	^ self uri
]

{ #category : #accessing }
WARequest >> user [
	"Answer the username from basic authentication."
	
	| authorization |
	^ (authorization := self authorization) isNil
		ifFalse: [ authorization copyUpTo: $: ]
]

{ #category : #'accessing-headers' }
WARequest >> userAgent [
	^ self headerAt: 'user-agent'
]

{ #category : #accessing }
WARequest >> version [
	^ version
]

{ #category : #accessing }
WARequest >> version: aVersion [
	version := aVersion
]
