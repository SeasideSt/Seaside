tests
testParameterMatchingNoParameters
	| route parameters |
	route := WARoute get: '/{1}/_all_docs' selector: #a:.
	self assert: (route matchesParameters: Dictionary new).
	parameters := Dictionary new at: 'key' put: 'value'; yourself.
	self deny: (route matchesParameters: parameters)