writing
rfc2109String
	"Serializes the receiver according to RFC 2109.
	Almost no browser support.
	It can be used with HTTP header combining.
	See class comment for a link to the spec."
	self greaseDeprecatedApi: 'WACookie>>#rfc2109String' details: 'Use #rfc6265String instead.'. 
	^ String streamContents: [ :stream |
		self writeKeyValueQuoted: true on: stream.
		self writeCommentOn: stream.
		self writeMaxAgeQuoted: true on: stream.
		self writePathQuoted: true on: stream.
		self writeDomainQuoted: true on: stream.
		self writeSecureOn: stream.
		self writeHttpOnlyOn: stream.
		self writeSameSiteOn: stream.
		self writeVersionOn: stream ]