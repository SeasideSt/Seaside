tests
testUserinfo
	url
		host: 'seaside.st';
		userinfo: 'foo:bar'.
	self assert: url userinfo = 'foo:bar'.
	self assert: url greaseString = 'http://foo%3Abar@seaside.st/'.
	"A colon needs to be escaped unless it is separating a (deprecated) password
	part. This password part must be specified with #password: because we can't
	tell the difference between the two types of colons in #userinfo:."
	self assert: url user = 'foo:bar'.
	self assert: url password isNil.
	url user: 'foo'; password: 'bar'.
	self assert: url userinfo = 'foo:bar'.
	self assert: url user = 'foo'.
	self assert: url password = 'bar'
	