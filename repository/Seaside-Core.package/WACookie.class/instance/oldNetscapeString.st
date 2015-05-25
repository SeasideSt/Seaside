writing
oldNetscapeString
	"Serializes the receiver accroding to the orginal Netscape spec.
	This has the broadest browser support but limited features.
	It can not be used with HTTP header combining.
	See class comment for a link to the spec."
	^ String streamContents: [ :stream |
		self writeKeyValueQuoted: false on: stream.
		self writeExpiresOn: stream.
		self writePathQuoted: false on: stream.
		self writeDomainQuoted: false on: stream.
		self writeSecureOn: stream.
		self writeHttpOnlyOn: stream ]