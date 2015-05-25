tests-cache
testDefaultCache
	self deny: (self response headers includesKey: 'Pragma').
	self deny: (self response headers includesKey: 'Expires').
	self deny: (self response headers includesKey: 'Cache-Control')