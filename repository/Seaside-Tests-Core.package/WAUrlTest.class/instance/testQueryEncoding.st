tests-encoding
testQueryEncoding
	self
		assert: (url withField: '/' value: ' ')
			printString = '/?%2F=%20'.
	self
		assert: (url withField: '+' value: '%')
			printString = '/?%2B=%25'.
	self
		assert: (url withField: '?' value: '&')
			printString = '/?%3F=%26'.
	self
		assert: (url withField: '[' value: ']')
			printString = '/?%5B=%5D'.
	self
		assert: (url withField: '=' value: '<')
			printString = '/?%3D=%3C'