tests
testPathMatching
	| route |
	route := WARoute get: #a:.
	self deny: (route matchesPath: Array new).
	self assert: (route matchesPath: #('something')).
	self deny: (route matchesPath: #('something' 'else')).
	self assert: (route priority = 1).
	
	route := WARoute get: #a:b:.
	self deny: (route matchesPath: Array new).
	self deny: (route matchesPath: #('something')).
	self assert: (route matchesPath: #('something' 'else')).
	self deny: (route matchesPath: #('something' 'else' 'more')).
	self assert: (route priority = 2)