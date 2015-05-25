tests
testCount
	| route |
	route := WARoute get: #listDatabases.
	self assert: route pathElementCount isZero.
	
	route := WARoute get: #getDatabase:.
	self assert: route pathElementCount = 1.
	
	route := WARoute get: #getDatabase:document:.
	self assert: route pathElementCount = 2