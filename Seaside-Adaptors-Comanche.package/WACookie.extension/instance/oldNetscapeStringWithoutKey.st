*Seaside-Adaptors-Comanche
oldNetscapeStringWithoutKey
	"same as oldNetscapeString except that the key is not included, used for Kom hacks"
	^ String streamContents: [ :stream |
		self value isNil ifFalse: [
			stream nextPutAll: self value ].
		self writeExpiresOn: stream.
		self writePathQuoted: false on: stream.
		self writeDomainQuoted: false on: stream.
		self writeSecureOn: stream.
		self writeHttpOnlyOn: stream ]