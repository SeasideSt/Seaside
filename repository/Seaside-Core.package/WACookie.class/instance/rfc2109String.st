writing
rfc2109String
	"Serializes the receiver accroding to RFC 2109.
	Almost no browser support.
	It can be used with HTTP header combining.
	See class comment for a link to the spec."
	^ String streamContents: [ :stream |
		self writeKeyValueQuoted: true on: stream.
		self writeCommentOn: stream.
		self writeMaxAgeOn: stream.
		self writePathQuoted: true on: stream.
		self writeDomainQuoted: true on: stream.
		self writeSecureOn: stream.
		self writeHttpOnlyOn: stream.
		self writeVersionOn: stream ]