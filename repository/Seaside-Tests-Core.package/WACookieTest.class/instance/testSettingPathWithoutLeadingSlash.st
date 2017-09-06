tests
testSettingPathWithoutLeadingSlash
	"According to https://tools.ietf.org/html/rfc6265#section-5.1.4
	user-agents must ignore paths without leading slash and use '/'.
	We ensure that the path starts with slash. (see class comment)"
	| cookie |
	cookie := WACookie new
		key: 'name';
		value: 'homer';
		path: 'springfield/powerplant';
		yourself.

	self assert: cookie path equals: '/springfield/powerplant'.
	self assert: cookie pathUnencoded equals: '/springfield/powerplant'.
	self assert: cookie pathEncoded equals: '/springfield/powerplant'
	