Extension { #name : #WACookie }

{ #category : #'*Seaside-Adaptors-Comanche' }
WACookie >> oldNetscapeStringWithoutKey [
	"same as oldNetscapeString except that the key is not included, used for Kom hacks"
	self greaseDeprecatedApi: 'WACookie>>#oldNetscapeStringWithoutKey' details: 'Use #rfc6265StringWithoutKey instead.'.
	^ String streamContents: [ :stream |
		self value isNil ifFalse: [
			stream nextPutAll: self value ].
		self writeExpiresOn: stream.
		self writePathQuoted: false on: stream.
		self writeDomainQuoted: false on: stream.
		self writeSecureOn: stream.
		self writeHttpOnlyOn: stream ]
]

{ #category : #'*Seaside-Adaptors-Comanche' }
WACookie >> rfc6265StringWithoutKey [
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
]
