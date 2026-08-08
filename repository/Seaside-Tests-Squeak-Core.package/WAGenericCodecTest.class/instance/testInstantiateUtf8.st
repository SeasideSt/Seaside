tests
testInstantiateUtf8
	self 
		should: [ GRSqueakGenericCodec forEncoding: 'utf-8' ]
		raise: GRUnsupportedEncodingError