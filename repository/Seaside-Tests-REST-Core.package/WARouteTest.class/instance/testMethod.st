tests
testMethod
	| route |
	route := WARoute get: #listDatabases.
	self assert: route method = 'GET'.
	
	route := WARoute post: #createDatabase:document:.
	self assert: route method = 'POST'.
	
	route := WARoute copy: #copyDatabase:document:.
	self assert: route method = 'COPY'.
	
	route := WARoute patch: #updateDatabase:document:.
	self assert: route method = 'PATCH'.
	
	route := WARoute options: #options.
	self assert: route method = 'OPTIONS'