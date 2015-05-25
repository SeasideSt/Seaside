tests
testPathMatching
	| route |
	route := WARoute get: '/{1}/_all_docs' selector: #a:.
	self deny: (route matchesPath: #('something')).
	self assert: (route matchesPath: #('something' '_all_docs')).
	self deny: (route matchesPath: #('something' 'else')).
	self deny: (route matchesPath: #('something' '_all_docs' 'more')).
	self assert: (route priority = 5)