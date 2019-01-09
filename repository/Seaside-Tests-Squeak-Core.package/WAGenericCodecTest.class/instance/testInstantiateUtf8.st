tests
testInstantiateUtf8
	self 
		should: [ GRPharoGenericCodec forEncoding: 'utf-8' ]
		raise: GRUnsupportedEncodingError