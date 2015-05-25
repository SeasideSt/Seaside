tests
testEncodedUrl
	self assert: 'Seaside Aubergines' urlEncodedGives: 'Seaside%20Aubergines'.
	self assert: 'www.seaside.st' urlEncodedGives: 'www.seaside.st'.
	self assert: '~seaside-info_' urlEncodedGives: '~seaside-info_'.
	self assert: 'http://www.seaside.st?foo=1&bar=2' urlEncodedGives: 'http%3A%2F%2Fwww.seaside.st%3Ffoo%3D1%26bar%3D2'.
	self assert: 'a%' urlEncodedGives: 'a%25'.
	self assert: (String with: Character cr) urlEncodedGives: '%0D'