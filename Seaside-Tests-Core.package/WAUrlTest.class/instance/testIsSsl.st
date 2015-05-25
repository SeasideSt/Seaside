testing-parsing
testIsSsl
	url := WAUrl absolute: 'https://www.seaside.st/'.
	self assert: url isSsl.
	url := WAUrl absolute: 'http://www.seaside.st/'.
	self deny: url isSsl.
	url := WAUrl absolute: 'ftps://www.seaside.st/'.
	self assert: url isSsl.
	url := WAUrl absolute: 'ftp://www.seaside.st/'.
	self deny: url isSsl.
	self deny: WAUrl new isSsl