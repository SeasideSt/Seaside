writing
rfc6265String
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