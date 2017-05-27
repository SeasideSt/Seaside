tests
testSettingEmptyPath
	"According to https://tools.ietf.org/html/rfc6265#section-5.1.4
	user-agents must use '/' as the default path (see class comment)"
	| cookie |
	cookie := WACookie new
		key: 'name';
		value: 'homer';
		path: '';
		yourself.

	self assert: cookie path equals: '/'.
	self assert: cookie pathUnencoded equals: '/'.
	self assert: cookie pathEncoded equals: '/'
	