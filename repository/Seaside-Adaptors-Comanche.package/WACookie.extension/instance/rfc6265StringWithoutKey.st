*Seaside-Adaptors-Comanche
rfc6265StringWithoutKey
	"same as oldNetscapeString except that the key is not included, used for Kom hacks"
	^ String streamContents: [ :stream |
		| useQuotes |
		"the spec allows us to quote but we don't know how good browser support is"
		useQuotes := false.
		self value isNil ifFalse: [
			self
				write: self value
				quoted: useQuotes
				on: stream ].
		self writeExpiresOn: stream.
		self writeMaxAgeQuoted: useQuotes on: stream.
		self writeDomainQuoted: useQuotes on: stream.
		self writePathQuoted: useQuotes on: stream.
		self writeSecureOn: stream.
		self writeHttpOnlyOn: stream ]