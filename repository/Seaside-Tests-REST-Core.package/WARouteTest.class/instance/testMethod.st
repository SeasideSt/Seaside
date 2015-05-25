tests
testMethod
	| route |
	route := WARoute get: #listDatabases.
	self assert: route method = 'GET'.
	
	route := WARoute post: #createDatabase:document:.
	self assert: route method = 'POST'.
	
	route := WARoute copy: #copyDatabase:document:.
	self assert: route method = 'COPY'