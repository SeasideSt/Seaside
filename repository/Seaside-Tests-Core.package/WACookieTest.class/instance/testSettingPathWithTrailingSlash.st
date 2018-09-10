tests
testSettingPathWithTrailingSlash
 	"According to https://tools.ietf.org/html/rfc6265#section-5.1.4
 	trailing slashes must be ignored by user-agents (see class comment)"
 	| cookie |
 	cookie := WACookie new
 		key: 'name';
 		value: 'homer';
 		path: '/springfield/';
 		yourself.

 	self assert: cookie path equals: '/springfield'.
 	self assert: cookie pathUnencoded equals: '/springfield'.
 	self assert: cookie pathEncoded equals: '/springfield'