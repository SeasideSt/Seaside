tests
testSettingRootPath
	| cookie |
	cookie := WACookie new
		key: 'name';
		value: 'homer';
		path: '/';
		yourself.

	self assert: cookie path equals: '/'.
	self assert: cookie pathUnencoded equals: '/'.
	self assert: cookie pathEncoded equals: '/'
	