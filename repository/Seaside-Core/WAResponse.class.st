"
A WAResponse is an abstract HTTP response objects. It is independent of the used server adapter.

Instance Variables
	status:		<Integer> The HTTP status code.
	message:	<String> The HTTP status message.
	headers:	<WAHeaderFields> A dictionary with the header fields.
	cookies:	<OrderedCollection> A collection of cookies.

"
Class {
	#name : #WAResponse,
	#superclass : #WAObject,
	#instVars : [
		'headers',
		'cookies',
		'status',
		'message'
	],
	#classVars : [
		'StatusMessages'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #initialization }
WAResponse class >> initialize [
	self initializeStatusMessages
]

{ #category : #initialization }
WAResponse class >> initializeStatusMessages [
	StatusMessages := Dictionary new.
	StatusMessages
		at: self statusContinue put: 'Continue';
		at: self statusSwitchingProtocols put: 'Switching Protocols';
		at: self statusProcessing put: 'Processing';
		at: self statusOk put: 'OK';
		at: self statusCreated put: 'Created';
		at: self statusAccepted put: 'Accepted';
		at: self statusNonAuthoritativeInformation put: 'Non-Authoritative Information';
		at: self statusNoContent put: 'No Content';
		at: self statusResetContent put: 'Reset Content';
		at: self statusPartialContent put: 'Partial Content';
		at: self statusMultiStatus put: 'Multi-Status';
		at: self statusAlreadyReported put: 'Already Reported';
		at: self statusInstanceManipulationUsed put: 'IM Used';		
		at: self statusMultipleChoices put: 'Multiple Choices';
		at: self statusMovedPermanently put: 'Moved Permanently';
		at: self statusFound put: 'Found';
		at: self statusSeeOther put: 'See Other';
		at: self statusNotModified put: 'Not Modified';
		at: self statusUseProxy put: 'Use Proxy';
		at: self statusTemporaryRedirect put: 'Temporary Redirect';
		at: self statusPermanentRedirect put: 'Permanent Redirect';
		at: self statusBadRequest put: 'Bad Request';
		at: self statusUnauthorized put: 'Unauthorized';
		at: self statusPaymentRequired put: 'Payment Required';
		at: self statusForbidden put: 'Forbidden';
		at: self statusNotFound put: 'Not Found';
		at: self statusMethodNotAllowed put: 'Method Not Allowed';
		at: self statusNotAcceptable put: 'Not Acceptable';
		at: self statusProxyAuthenticationRequired put: 'Proxy Authentication Required';
		at: self statusRequestTimeout put: 'Request Timeout';
		at: self statusConflict put: 'Conflict';
		at: self statusGone put: 'Gone';
		at: self statusLengthRequired put: 'Length Required';
		at: self statusPreconditionFailed put: 'Precondition Failed';
		at: self statusRequestEntityTooLarge put: 'Request Entity Too Large';
		at: self statusRequestUriTooLong put: 'Request-URI Too Long';
		at: self statusUnsupportedMediaType put: 'Unsupported Media Type';
		at: self statusRequestedRangeNotSatisfiable put: 'Requested Range Not Satisfiable';
		at: self statusExpectationFailed put: 'Expectation Failed';
		at: self statusImATeapot put: 'I''m a teapot';
		at: self statusUnprocessableEntity put: 'Unprocessable Entity';
		at: self statusLocked put: 'Locked';
		at: self statusFailedDependency put: 'Failed Dependency';
		at: self statusUpgradeRequired put: 'Upgrade Required';
		at: self statusPreconditionRequired put: 'Precondition Required';
		at: self statusTooManyRequests put: 'Too Many Requests';
		at: self statusRequestHeaderFieldsTooLarge put: 'Request Header Fields Too Large';
		at: self statusInternalServerError put: 'Internal Server Error';
		at: self statusNotImplemented put: 'Not Implemented';
		at: self statusBadGateway put: 'Bad Gateway';
		at: self statusServiceUnavailable put: 'Service Unavailable';
		at: self statusGatewayTimeout put: 'Gateway Timeout';
		at: self statusHttpVersionNotSupported put: 'HTTP Version Not Supported';
		at: self statusVariantAlsoNegotiates put: 'Variant Also Negotiates';
		at: self statusInsufficientStorage put: 'Insufficient Storage';
		at: self statusLoopDetected put: 'Loop Detected';
		at: self statusNotExtended put: 'Not Extended';
		at: self statusNetworkAuthenticationRequired put: 'Network Authentication Required'
]

{ #category : #accessing }
WAResponse class >> messageForStatus: anInteger [
	^ StatusMessages at: anInteger ifAbsent: [ nil ]
]

{ #category : #'status-success' }
WAResponse class >> statusAccepted [
	^ 202
]

{ #category : #'status-success' }
WAResponse class >> statusAlreadyReported [
	^ 208
]

{ #category : #'status-server-error' }
WAResponse class >> statusBadGateway [
	^ 502
]

{ #category : #'status-client-error' }
WAResponse class >> statusBadRequest [
	^ 400
]

{ #category : #'status-server-error' }
WAResponse class >> statusBandwidthLimitExceeded [
	^ 509
]

{ #category : #'status-client-error' }
WAResponse class >> statusConflict [
	^ 409
]

{ #category : #'status-informal' }
WAResponse class >> statusContinue [
	^ 100
]

{ #category : #'status-success' }
WAResponse class >> statusCreated [
	^ 201
]

{ #category : #'status-client-error' }
WAResponse class >> statusExpectationFailed [
	^ 417
]

{ #category : #'status-client-error' }
WAResponse class >> statusFailedDependency [
	^ 424
]

{ #category : #'status-client-error' }
WAResponse class >> statusForbidden [
	^ 403
]

{ #category : #'status-redirection' }
WAResponse class >> statusFound [
	^ 302
]

{ #category : #'status-server-error' }
WAResponse class >> statusGatewayTimeout [
	^ 504
]

{ #category : #'status-client-error' }
WAResponse class >> statusGone [
	^ 410
]

{ #category : #'status-server-error' }
WAResponse class >> statusHttpVersionNotSupported [
	^ 505
]

{ #category : #'status-client-error' }
WAResponse class >> statusImATeapot [
	^ 418
]

{ #category : #'status-success' }
WAResponse class >> statusInstanceManipulationUsed [
	^ 226
]

{ #category : #'status-server-error' }
WAResponse class >> statusInsufficientStorage [
	^ 507
]

{ #category : #'status-server-error' }
WAResponse class >> statusInternalServerError [
	^ 500
]

{ #category : #'status-client-error' }
WAResponse class >> statusLengthRequired [
	^ 411
]

{ #category : #'status-client-error' }
WAResponse class >> statusLocked [
	^ 423
]

{ #category : #'status-server-error' }
WAResponse class >> statusLoopDetected [
	^ 508
]

{ #category : #'status-client-error' }
WAResponse class >> statusMethodNotAllowed [
	^ 405
]

{ #category : #'status-redirection' }
WAResponse class >> statusMovedPermanently [
	^ 301
]

{ #category : #'status-success' }
WAResponse class >> statusMultiStatus [
	^ 207
]

{ #category : #'status-redirection' }
WAResponse class >> statusMultipleChoices [
	^ 300
]

{ #category : #'status-server-error' }
WAResponse class >> statusNetworkAuthenticationRequired [
	^ 511
]

{ #category : #'status-success' }
WAResponse class >> statusNoContent [
	^ 204
]

{ #category : #'status-success' }
WAResponse class >> statusNonAuthoritativeInformation [
	^ 203
]

{ #category : #'status-client-error' }
WAResponse class >> statusNotAcceptable [
	^ 406
]

{ #category : #'status-server-error' }
WAResponse class >> statusNotExtended [
	^ 510
]

{ #category : #'status-client-error' }
WAResponse class >> statusNotFound [
	^ 404
]

{ #category : #'status-server-error' }
WAResponse class >> statusNotImplemented [
	^ 501
]

{ #category : #'status-redirection' }
WAResponse class >> statusNotModified [
	^ 304
]

{ #category : #'status-success' }
WAResponse class >> statusOk [
	^ 200
]

{ #category : #'status-success' }
WAResponse class >> statusPartialContent [
	^ 206
]

{ #category : #'status-client-error' }
WAResponse class >> statusPaymentRequired [
	^ 402
]

{ #category : #'status-redirection' }
WAResponse class >> statusPermanentRedirect [
	^ 308
]

{ #category : #'status-client-error' }
WAResponse class >> statusPreconditionFailed [
	^ 412
]

{ #category : #'status-client-error' }
WAResponse class >> statusPreconditionRequired [
	^ 428
]

{ #category : #'status-informal' }
WAResponse class >> statusProcessing [
	^ 102
]

{ #category : #'status-client-error' }
WAResponse class >> statusProxyAuthenticationRequired [
	^ 407
]

{ #category : #'status-client-error' }
WAResponse class >> statusRequestEntityTooLarge [
	^ 413
]

{ #category : #'status-client-error' }
WAResponse class >> statusRequestHeaderFieldsTooLarge [
	^ 431
]

{ #category : #'status-client-error' }
WAResponse class >> statusRequestTimeout [
	^ 408
]

{ #category : #'status-client-error' }
WAResponse class >> statusRequestUriTooLong [
	^ 414
]

{ #category : #'status-client-error' }
WAResponse class >> statusRequestedRangeNotSatisfiable [
	^ 416
]

{ #category : #'status-success' }
WAResponse class >> statusResetContent [
	^ 205
]

{ #category : #'status-redirection' }
WAResponse class >> statusSeeOther [
	^ 303
]

{ #category : #'status-server-error' }
WAResponse class >> statusServiceUnavailable [
	^ 503
]

{ #category : #'status-redirection' }
WAResponse class >> statusSwitchProxy [
	^ 306
]

{ #category : #'status-informal' }
WAResponse class >> statusSwitchingProtocols [
	^ 101
]

{ #category : #'status-redirection' }
WAResponse class >> statusTemporaryRedirect [
	^ 307
]

{ #category : #'status-client-error' }
WAResponse class >> statusTooManyRequests [
	^ 429
]

{ #category : #'status-client-error' }
WAResponse class >> statusUnauthorized [
	^ 401
]

{ #category : #'status-client-error' }
WAResponse class >> statusUnorderedCollection [
	^ 425
]

{ #category : #'status-client-error' }
WAResponse class >> statusUnprocessableEntity [
	^ 422
]

{ #category : #'status-client-error' }
WAResponse class >> statusUnsupportedMediaType [
	^ 415
]

{ #category : #'status-client-error' }
WAResponse class >> statusUpgradeRequired [
	^ 426
]

{ #category : #'status-redirection' }
WAResponse class >> statusUseProxy [
	^ 305
]

{ #category : #'status-server-error' }
WAResponse class >> statusVariantAlsoNegotiates [
	^ 506
]

{ #category : #'accessing-cookies' }
WAResponse >> addCookie: aCookie [
	"Add the cookie to the receiver."

	^ self cookies add: aCookie
]

{ #category : #'convenience-headers' }
WAResponse >> attachmentWithFileName: aString [ 
	aString notNil ifTrue:  [
		self 
			headerAt: 'Content-Disposition'
			put: 'attachment; filename="' , aString greaseString , '"' ]
]

{ #category : #status }
WAResponse >> authenticationFailed [
	"Indicate that the request requires HTTP authentication."
	
	self status: WAResponse statusUnauthorized
]

{ #category : #status }
WAResponse >> badRequest [
	"The request could not be understood by the server due to malformed syntax. The client SHOULD NOT repeat the request without modifications."
	
	self status: WAResponse statusBadRequest
]

{ #category : #'convenience-status' }
WAResponse >> basicAuthenticationRealm: aString [ 
	self 
		headerAt: 'WWW-Authenticate'
		put: 'Basic realm="' , aString greaseString , '"'.
	self authenticationFailed
]

{ #category : #streaming }
WAResponse >> binary [
	"put the response stream into binary mode"
	
	self subclassResponsibility
]

{ #category : #'convenience-caching' }
WAResponse >> cacheFor: aDuration [
	"Configure the receiver to be cached for aDuration."

	self removeHeaderAt: 'Pragma'. "Proxies"
	self headerAt: 'Expires' putDate: DateAndTime now + aDuration. "HTTP 1.0"
	self headerAt: 'Cache-Control' put: 'max-age=' , aDuration asSeconds printString "HTTP 1.1"
]

{ #category : #'convenience-caching' }
WAResponse >> cacheForever [
	"Configure the response to be cached by user agents."
	
	self removeHeaderAt: 'Pragma'. "Proxies"
	self headerAt: 'Expires' putDate: self cacheForeverExpiryDate. "HTTP 1.0"
	self removeHeaderAt: 'Cache-Control' "HTTP 1.1"
]

{ #category : #configuration }
WAResponse >> cacheForeverExpiryDate [
	"Answer the expiry date that should be used if the response should be cached forever.
	
	Note that according to HTTP 1.1 says: To mark a response as 'never expires,' an origin server sends an Expires date approximately one year from the time the response is sent. HTTP/1.1 servers SHOULD NOT send Expires dates more than one year in the future."
	
	^ (DateAndTime now) + (Duration days: 300 hours: 0 minutes: 0 seconds: 0)
]

{ #category : #'convenience-accessing' }
WAResponse >> contentType [
	^ self headerAt: 'Content-Type' ifAbsent: [ WAMimeType textPlain ]
]

{ #category : #'convenience-accessing' }
WAResponse >> contentType: aMimeType [
	self headerAt: 'Content-Type' put: aMimeType
]

{ #category : #accessing }
WAResponse >> cookies [
	"Answer the cookies of this response."

	^ cookies
]

{ #category : #status }
WAResponse >> created [
	"The request has been fulfilled and resulted in a new resource being created."
	
	self status: WAResponse statusCreated
]

{ #category : #'accessing-cookies' }
WAResponse >> deleteCookie: aCookie [ 
	"Try to get the path from the closest entry point in the context. This path
	is used in case the browser did not provide the path information in the cookie.
	Trouble is, this method may be called in a context where WACurrentRequestContext
	is not defined or where there is no RequestHandler. In this case, we just use nil and
	pray the cookie has path information or was created without any."
	
	| baseUrl |
	baseUrl := [ self requestContext handler url ] 
		on: WARequestContextNotFound
		do: [ :err | nil ].
	self 
		deleteCookie: aCookie
		path: (baseUrl isNil ifFalse: [ baseUrl pathStringUnencoded ])
		domain: (baseUrl isNil ifFalse: [ baseUrl host ])
]

{ #category : #'accessing-cookies' }
WAResponse >> deleteCookie: aCookie path: aPathString domain: aDomainString [
	"Delete the cookie in the browser.
	
	The spec sez:
	If a CGI script wishes to delete a cookie, it can do so by returning a cookie with the same name, and an expires time which is in the past. The path and name must match exactly in order for the expiring cookie to replace the valid cookie. This requirement makes it difficult for anyone but the originator of a cookie to delete a cookie.
	
	What is not specified but also has to match is the domain.
	
	The trouble is:
	Browsers that follow the Netscape spec don't send path or domain information"
	| copy |
	copy := (WACookie 
		key: aCookie key
		value: '')
		pathUnencoded: aCookie pathUnencoded encoded: aCookie pathEncoded;
		version: aCookie version;
		domain: aCookie domain;
		yourself.
	aCookie version isNil ifTrue:  [
		"old Netscape cookie with no path or domain information"
		aPathString isNil ifFalse: [ 
			copy path: aPathString ].
		aDomainString isNil ifFalse: [
			copy domain: aDomainString ] ].
	copy expireInPast.
	self addCookie: copy
]

{ #category : #'accessing-cookies' }
WAResponse >> deleteCookieAt: aKeyString [
	"Delete the cookie in the browser. This method is quite unreliable. Consider using #deleteCookie:"
	self deleteCookie: (WACookie key: aKeyString value: '')
]

{ #category : #initialization }
WAResponse >> destroy [
	headers := cookies := nil
]

{ #category : #'convenience-caching' }
WAResponse >> doNotCache [
	"Configure the receiver to not be cached at all."
	
	self headerAt: 'Pragma' put: 'no-cache'. "Proxies"
	self headerAt: 'Expires' putDate: self doNotCacheExpiryDate. "HTTP 1.0"
	"http://blog.55minutes.com/2011/10/how-to-defeat-the-browser-back-button-cache/"
	"https://code.google.com/p/seaside/issues/detail?id=772"
	self headerAt: 'Cache-Control' put: 'no-cache, max-age=0, must-revalidate, no-store' "HTTP 1.1"
	
]

{ #category : #configuration }
WAResponse >> doNotCacheExpiryDate [
	"Answer the expiry date that should be used if the response should not be cached at all."
	
	^ DateAndTime year: 2000 month: 1 day: 1 hour: 0 minute: 0 second: 0
]

{ #category : #documents }
WAResponse >> document: aDocument [
	| document mimeType |
	document := aDocument seasideMimeDocument.
	self attachmentWithFileName: document fileName.
	mimeType := document mimeType.
	self contentType: mimeType.
	mimeType isBinary
		ifTrue: [ self binary ].
	self nextPutAll: document content
]

{ #category : #documents }
WAResponse >> document: anObject mimeType: aMimeType [
	self document: (anObject seasideMimeDocument 
		mimeType: aMimeType;
		yourself)
]

{ #category : #documents }
WAResponse >> document: anObject mimeType: aMimeType fileName: aString [
	self document: (anObject seasideMimeDocument 
		mimeType: aMimeType;
		fileName: aString;
		yourself)
]

{ #category : #public }
WAResponse >> flush [
	"Flush the receiver and send partial content
	By default do nothing"
]

{ #category : #status }
WAResponse >> forbidden [
	"Indicate that the server understood the request but refused to fulfill it."
	
	self status: WAResponse statusForbidden
]

{ #category : #status }
WAResponse >> found [
	"Indicate that the resource reside temporarily under a different URI."
	
	self status: WAResponse statusFound
]

{ #category : #'convenience-headers' }
WAResponse >> frameOptions: aString [
	"This header will be deprecated and it's functionality will be moved to Content-Security-Policy 1.1 (which does not have the same level of support yet)."
	
	self
		headerAt: 'X-Frame-Options'
		put: aString
]

{ #category : #status }
WAResponse >> gone [
	"Indicate that the resource is no longer available at the server and no forwarding address is known."
	
	self status: WAResponse statusGone
]

{ #category : #'accessing-headers' }
WAResponse >> headerAt: aString [
	"Answer the header with aString."
	
	^ self headers at: aString
]

{ #category : #'accessing-headers' }
WAResponse >> headerAt: aString append: aValue [ 
	"Appends a response header with aString and aValue. This method allows response headers to have multiple values."
	^ self headers 
		at: aString
		add: aValue greaseString
]

{ #category : #'accessing-headers' }
WAResponse >> headerAt: aString ifAbsent: aBlock [
	"Answer the header with aString, if none answer the result of evaluating aBlock."
	
	^ self headers at: aString ifAbsent: aBlock
]

{ #category : #'accessing-headers' }
WAResponse >> headerAt: aString put: aValue [
	"Set a response header with aString and aValue. If the header had already been set, the new value overwrites the previous one."
	
	^ self headers at: aString put: aValue
]

{ #category : #'accessing-headers' }
WAResponse >> headerAt: aKeyString putDate: aDateAndTime [ 
	"Convenience method that sets a response header with aKeyString and aDateAndTime. If the header had already been set, the new value overwrites the previous one."
	^ self 
		headerAt: aKeyString
		put: (GRPrinter httpDate print: aDateAndTime)
]

{ #category : #accessing }
WAResponse >> headers [
	"Answer the headers of this response."
	
	^ headers
]

{ #category : #configuration }
WAResponse >> httpVersion [
	"Answer the HTTP version to be used."

	^ 'HTTP/1.1'
]

{ #category : #initialization }
WAResponse >> initialize [
	super initialize.
	self initializeFields
]

{ #category : #initialization }
WAResponse >> initializeFields [
	status := 200.
	message := 'OK'.
	headers := WAHeaderFields new.
	cookies := OrderedCollection new
]

{ #category : #initialization }
WAResponse >> initializeOn: aStream [ 
	self initialize
]

{ #category : #'convenience-headers' }
WAResponse >> inlineWithFileName: aString [ 
	aString notNil ifTrue: [
		self 
			headerAt: 'Content-Disposition'
			put: 'inline; filename="' , aString greaseString , '"' ]
]

{ #category : #status }
WAResponse >> internalError [
	"Indicate an error inside the server which prevented it from fulfilling the request."

	self status: WAResponse statusInternalServerError
]

{ #category : #testing }
WAResponse >> isCommitted [
	"Answer a boolean indicating if the response header has been committed."
	
	^ false
]

{ #category : #testing }
WAResponse >> isStreamingResponse [
	"Return true if the receiver supports partial stream responses."

	^ false
]

{ #category : #'convenience-headers' }
WAResponse >> location: aUrlOrString [ 
	self 
		headerAt: 'Location'
		put: aUrlOrString
]

{ #category : #accessing }
WAResponse >> message [
	"Answer the message associated with this response."

	^ message
]

{ #category : #status }
WAResponse >> movedPermanently [
	"The requested resource has been assigned a new permanent URI and any future references to this resource SHOULD use one of the returned URIs."
	
	self status: WAResponse statusMovedPermanently
]

{ #category : #streaming }
WAResponse >> nextPut: aByteOrCharacter [
	"Append the element to the body part of the response."
	
	self stream nextPut: aByteOrCharacter
]

{ #category : #streaming }
WAResponse >> nextPutAll: aStringOrByteArray [
	"Append the elements of aStringOrByteArray to the body part of the response."
	
	self stream nextPutAll: aStringOrByteArray
]

{ #category : #status }
WAResponse >> notFound [
	"Indicate that the requested resource is not available."
	
	self status: WAResponse statusNotFound
]

{ #category : #status }
WAResponse >> notImplemented [
	"Indicate the HTTP server does not support the functionality needed to fulfill the request."
	
	self status: WAResponse statusNotImplemented
]

{ #category : #status }
WAResponse >> preconditionFailed [
	"The precondition given in one or more of the request-header fields evaluated to false when it was tested on the server. This response code allows the client to place preconditions on the current resource metainformation (header field data) and thus prevent the requested method from being applied to a resource other than the one intended."
	
	self status: WAResponse statusPreconditionFailed
]

{ #category : #printing }
WAResponse >> printOn: aStream [ 
	super printOn: aStream.
	aStream nextPutAll: ' status: '; print: self status.
	aStream nextPutAll: ' message: '; print: self message
]

{ #category : #'convenience-status' }
WAResponse >> redirectTo: aUrlOrString [
	self location: aUrlOrString.
	self found
]

{ #category : #'convenience-status' }
WAResponse >> refreshAfter: aDuration location: aUrl [ 
	self 
		headerAt: 'Refresh'
		put: aDuration asSeconds greaseString , '; ' , aUrl greaseString
]

{ #category : #'accessing-headers' }
WAResponse >> removeHeaderAt: aString [
	"Removes all occurences of the header value aString."

	^ self headers removeKey: aString
]

{ #category : #convenience }
WAResponse >> resetIfPossible [
	"Try to reset the receiver, answer whether it was successful.
	Resetting may fail in stream method the response is already committed."
	self initializeFields.
	^ true
]

{ #category : #convenience }
WAResponse >> respond [
	WAResponseNotification signal
]

{ #category : #accessing }
WAResponse >> status [
	"Answer the status code associated with this response."

	^ status
]

{ #category : #'accessing-status' }
WAResponse >> status: aNumber [
	"Set the status to aNumber and associate the default message."

	self status: aNumber message: (self class messageForStatus: aNumber)
]

{ #category : #'accessing-status' }
WAResponse >> status: aNumber message: aString [
	"Set the status to aNumber and the message to aString."
	
	status := aNumber.
	message := aString
]

{ #category : #accessing }
WAResponse >> stream [
	"Answer a write stream, this is where contents should be written to."
	
	self subclassResponsibility
]

{ #category : #'convenience-headers' }
WAResponse >> strictTransportSecurity: maxAge includeSubDomains: aBoolean [
	"Implements Strict Transport Security (STS).
		http://lists.w3.org/Archives/Public/www-archive/2009Dec/att-0048/draft-hodges-strict-transport-sec-06.plain.html
	Use only over secure connections (HTTPS)."
	
	self
		headerAt: 'Strict-Transport-Security'
		put: 'max-age=', maxAge greaseString,
			(aBoolean ifTrue: [ '; includeSubDomains' ] ifFalse: [ '' ])
]

{ #category : #writing }
WAResponse >> writeContentOn: aStream [
	self subclassResponsibility
]

{ #category : #writing }
WAResponse >> writeCookiesOn: aStream [
	cookies do: [ :each | 
		aStream nextPutAll: 'Set-Cookie: '.
		each writeOn: aStream.
		aStream crlf ]
]

{ #category : #writing }
WAResponse >> writeHeadersOn: aStream [ 
	headers keysAndValuesDo: [ :key :value | 
		aStream
			nextPutAll: key;
			nextPutAll: ': ';
			nextPutAll: value greaseString;
			crlf ]
]

{ #category : #writing }
WAResponse >> writeOn: aStream [
	self writeStatusOn: aStream.
	self writeHeadersOn: aStream.
	self writeCookiesOn: aStream.
	aStream crlf.
	self writeContentOn: aStream
]

{ #category : #writing }
WAResponse >> writeStatusOn: aStream [ 
	aStream nextPutAll: self httpVersion.
	aStream
		nextPut: $ ;
		nextPutAll: self status greaseString.
	self message isNil ifFalse:  [
		aStream
			nextPut: $ ;
			nextPutAll: self message ].
	aStream crlf
]
