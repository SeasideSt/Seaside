instance creation
fromString: aString 
	"Creates an array of cookies from a HTTP Cookie: header value."
	self greaseDeprecatedApi: 'WARequestCookie class>>#fromString:' details: 'Use #fromString:codec:.'.
	^ self fromString: aString codec: nil