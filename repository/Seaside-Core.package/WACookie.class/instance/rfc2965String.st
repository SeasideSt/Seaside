writing
rfc2965String
	"Serializes the receiver according to RFC 2965.
	This has the most features but is only supported in Opera.
	It can be used together with other serialization forms.
	It can be used with HTTP header combining.
	See class comment for a link to the spec."
	self greaseDeprecatedApi: 'WACookie>>#rfc2965String' details: 'Use #rfc6265String instead.'. 
	^ String streamContents: [ :stream |
		self writeKeyValueQuoted: true on: stream.
		self writeCommentOn: stream.
		self writeCommentUrlOn: stream.
		self writeMaxAgeQuoted: true on: stream.
		self writePathQuoted: true on: stream.
		self writePortsOn: stream.
		self writeDomainQuoted: true on: stream.
		self writeSecureOn: stream.
		self writeHttpOnlyOn: stream.
		self writeSameSiteOn: stream.
		self writeDiscardOn: stream.
		self writeVersionOn: stream ]