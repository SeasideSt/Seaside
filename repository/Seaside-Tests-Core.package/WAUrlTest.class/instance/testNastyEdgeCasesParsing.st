tests-encoding
testNastyEdgeCasesParsing
	url := (WAUrl absolute: 'http://example.com/blue+light%20blue?blue%2Blight+blue')
		decodedWith: GRNullCodec new.
	self assert: url path first = 'blue+light blue'.
	self assert: (url queryFields includesKey: 'blue+light blue').
	
	url := (WAUrl absolute: 'http://example.com/blue%2Fred%3Fand+green')
		decodedWith: GRNullCodec new.
	self assert: url path first = 'blue/red?and+green'.
	
	url := WAUrl absolute: '/blue?http://example.com/red'.
	self assert: url path = (OrderedCollection with: 'blue').
	self assert: url queryFields keys = #('http://example.com/red').
	self assert: url queryFields values = #(nil).
	
	url := (WAUrl absolute: 'http://example.com/:@-._~!$&''()*+,=;:@-._~!$&''()*+,=:@-._~!$&''()*+,==?/?:@-._~!$''()*+,;=/?:@-._~!$''()*+,;==#/?:@-._~!$&''()*+,;=')
		decodedWith: GRNullCodec new.
	self assert: url path first = ':@-._~!$&''()*+,='.
	self assert: (url pathParameterAllAt: 1 key: ':@-._~!$&''()*+,' ifAbsent: [ 'fail' ]) = #(':@-._~!$&''()*+' '==').
	self assert: (url queryFields at: '/?:@-._~!$''()* ,;') = '/?:@-._~!$''()* ,;=='.
	self assert: url fragment = '/?:@-._~!$&''()*+,;='