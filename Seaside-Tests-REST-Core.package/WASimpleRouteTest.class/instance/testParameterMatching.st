tests
testParameterMatching
	| route parameters |
	route := WARoute get: #a:.
	self assert: (route matchesParameters: Dictionary new).
	parameters := Dictionary new at: 'key' put: 'value'; yourself.
	self deny: (route matchesParameters: parameters)