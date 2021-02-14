"
I represent a cookie, a piece of information that is stored on the client and read and writable by the server. I am basically a key/value pair of strings.
You can never trust information in a cookie, the client is free to edit it.
I model only a part of the full cookie specification.

Browser support:
http://www.mnot.net/blog/2006/10/27/cookie_fun

Netscape spec
http://cgi.netscape.com/newsref/std/cookie_spec.html

Cookie spec
http://tools.ietf.org/html/rfc2109

Cookie 2 spec
https://tools.ietf.org/html/rfc6265

HttpOnly
http://msdn2.microsoft.com/en-us/library/ms533046.aspx
https://bugzilla.mozilla.org/show_bug.cgi?id=178993

Compared to WARequestCookie I represent the information that is sent to the user agent.

"
Class {
	#name : #WACookie,
	#superclass : #WARequestCookie,
	#instVars : [
		'expiry',
		'secure',
		'discard',
		'comment',
		'commentUrl',
		'httpOnly',
		'sameSite',
		'maxAge'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #convenience }
WACookie class >> combine: aCollectionOfCookies using: aOneArgumentBlock [
	"combines several cookies into one HTTP header line
	aOneArgumentBlock takes a cookie as an argument and returns a string,
	it is supposed to send one of #oldNetscapeString #rfc2109String #rfc2965String to the argument"
	^ String streamContents: [ :stream |
		aCollectionOfCookies
			do: [ :each |
				stream nextPutAll: (aOneArgumentBlock value: each) ]
			separatedBy: [ stream nextPutAll: ', ' ] ]
]

{ #category : #accessing }
WACookie >> comment [
	^ comment
]

{ #category : #accessing }
WACookie >> comment: aString [
	comment := aString
]

{ #category : #accessing }
WACookie >> commentUrl [
	^ commentUrl
]

{ #category : #accessing }
WACookie >> commentUrl: aUrl [
	commentUrl := aUrl
]

{ #category : #accessing }
WACookie >> discard [
	^ discard
]

{ #category : #accessing }
WACookie >> discard: aBoolean [
	discard := aBoolean
]

{ #category : #api }
WACookie >> expireIn: aDuration [
	"sets the lifetime of the receiver measured in a duration"
	self expiry: DateAndTime now + aDuration.
	self maxAge: aDuration asSeconds
]

{ #category : #api }
WACookie >> expireInPast [
	self maxAge: 0.
	self expiry: (DateAndTime now - (Duration days: 10 hours: 0 minutes: 0 seconds: 0))
]

{ #category : #api }
WACookie >> expireInSeconds: anInteger [
	"sets the lifetime of the receiver measured in seconds"
	self expiry: (Duration days: 0 hours: 0 minutes: 0 seconds: anInteger).
	self maxAge: anInteger
]

{ #category : #accessing }
WACookie >> expiry [
	^ expiry
]

{ #category : #accessing }
WACookie >> expiry: aDateTime [
	expiry := aDateTime asUTC
]

{ #category : #private }
WACookie >> expiryString [
	^ GRPrinter cookieTimestamp print: expiry
]

{ #category : #accessing }
WACookie >> httpOnly [
	^ httpOnly
]

{ #category : #accessing }
WACookie >> httpOnly: anObject [
	httpOnly := anObject
]

{ #category : #initialization }
WACookie >> initialize [
	super initialize.
	self secure: false.
	self discard: false.
	self httpOnly: false.
	self version: 1
]

{ #category : #accessing }
WACookie >> maxAge [
	^ maxAge
]

{ #category : #accessing }
WACookie >> maxAge: anInteger [
	"Optional.  The Max-Age attribute defines the lifetime of the
	cookie, in seconds.  The delta-seconds value is a decimal non-
	negative integer.  After delta-seconds seconds elapse, the client
	should discard the cookie.  A value of zero means the cookie
	should be discarded immediately."
	maxAge := anInteger
]

{ #category : #writing }
WACookie >> rfc6265String [
	"Serializes the receiver according to RFC 6265.
	See class comment for a link to the spec."
	^ String streamContents: [ :stream |
		| useQuotes |
		"the spec allows us to quote but we don't know how good browser support is"
		useQuotes := false.
		self writeKeyValueQuoted: useQuotes on: stream.
		self writeExpiresOn: stream.
		self writeMaxAgeQuoted: useQuotes on: stream.
		self writeDomainQuoted: useQuotes on: stream.
		self writePathQuoted: useQuotes on: stream.
		self writeSecureOn: stream.
		self writeHttpOnlyOn: stream.
		self writeSameSiteOn: stream ]
]

{ #category : #accessing }
WACookie >> sameSite [
	^ sameSite
]

{ #category : #accessing }
WACookie >> sameSite: aString [
	sameSite := aString
]

{ #category : #accessing }
WACookie >> secure [
	^ secure
]

{ #category : #accessing }
WACookie >> secure: aBoolean [
	secure := aBoolean
]

{ #category : #'writing-private' }
WACookie >> write: aString asQuotedStringOn: aStream [

	aStream nextPut: $".
	aString do: [ :each |
		each = $" 
			ifTrue: [ aStream nextPutAll: '\"' ]
			ifFalse: [ aStream nextPut: each ] ].
	aStream nextPut: $"
]

{ #category : #'writing-private' }
WACookie >> write: aString quoted: aBoolean on: aStream [
	aBoolean
		ifTrue: [
			self
				write: aString
				asQuotedStringOn: aStream ]
		ifFalse: [ aStream nextPutAll: aString ]
]

{ #category : #'writing-private' }
WACookie >> writeCommentOn: aStream [
	self comment isNil
		ifTrue: [ ^ self ].
	aStream nextPutAll: '; Comment='.
	self write: self comment asQuotedStringOn: aStream
]

{ #category : #'writing-private' }
WACookie >> writeCommentUrlOn: aStream [ 
	self commentUrl isNil ifTrue: [ ^ self ].
	aStream nextPutAll: '; CommentURL='.
	self 
		write: self commentUrl greaseString
		asQuotedStringOn: aStream
]

{ #category : #'writing-private' }
WACookie >> writeDiscardOn: aStream [
	(self discard notNil and: [ self discard ])
		ifTrue: [ aStream nextPutAll: '; Discard' ]
]

{ #category : #'writing-private' }
WACookie >> writeDomainQuoted: aBoolean on: aStream [
	domain isNil
		ifTrue: [ ^ self ].
	aStream nextPutAll: '; domain='.
	self write: self domain quoted: aBoolean on: aStream
]

{ #category : #'writing-private' }
WACookie >> writeExpiresOn: aStream [
	expiry isNil
		ifTrue: [ ^ self ].
	aStream
		nextPutAll: '; expires=';
		nextPutAll: self expiryString
]

{ #category : #'writing-private' }
WACookie >> writeHttpOnlyOn: aStream [
	self httpOnly
		ifTrue: [ aStream nextPutAll: '; HttpOnly' ]
]

{ #category : #'writing-private' }
WACookie >> writeKeyValueQuoted: aBoolean on: aStream [
	aStream nextPutAll: self key.
	aStream nextPut: $=.
	self
		write: (self value ifNil: [ '' ])
		quoted: aBoolean
		on: aStream
]

{ #category : #'writing-private' }
WACookie >> writeMaxAgeQuoted: aBoolean on: aStream [
	maxAge isNil
		ifTrue: [ ^ self ].
	aStream nextPutAll: '; Max-Age='.
	self write: self maxAge greaseString quoted: aBoolean on: aStream
]

{ #category : #writing }
WACookie >> writeOn: aStream [
	aStream nextPutAll: self rfc6265String
]

{ #category : #'writing-private' }
WACookie >> writePathQuoted: aBoolean on: aStream [
	pathEncoded isNil
		ifTrue: [ ^ self ].
	aStream nextPutAll: '; path='.
	self write: pathEncoded quoted: aBoolean on: aStream
]

{ #category : #'writing-private' }
WACookie >> writePortsOn: aStream [
	ports isEmptyOrNil
		ifTrue: [ ^ self ].
	aStream nextPutAll: '; Port="'.
	self ports do: [ :each | aStream print: each ] separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $"
]

{ #category : #'writing-private' }
WACookie >> writeSameSiteOn: aStream [
	sameSite isNil
		ifTrue: [ ^ self ].
	aStream
		nextPutAll: '; SameSite=';
		nextPutAll: sameSite
]

{ #category : #'writing-private' }
WACookie >> writeSecureOn: aStream [
	self secure
		ifTrue: [ aStream nextPutAll: '; Secure' ]
]

{ #category : #'writing-private' }
WACookie >> writeVersionOn: aStream [
	aStream nextPutAll: '; Version='.
	aStream print: self version
]
