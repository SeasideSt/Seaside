tests
testParameterMatchingOptionalParameters
	| route |
	route := WARoute get: '/{1}/_all_docs?required={2}' selector: #a:required:.
	route initializeOptionalQueryFieldParametersFrom: 'sorted,filter'.
	self assert: (route matchesParameters: (Dictionary new add: 'required' -> 'true';yourself)).
	self assert: (route matchesParameters: (Dictionary new add: 'required' -> 'true'; add: 'sorted' -> 'true'; yourself)).
	self assert: (route matchesParameters: (Dictionary new add: 'required' -> 'true'; add: 'sorted' -> 'true'; add: 'filter' -> 'none'; yourself)).

	self deny: (route matchesParameters: (Dictionary new add: 'required' -> 'true'; add: 'key' -> 'value'; yourself)).
	self deny: (route matchesParameters: (Dictionary new add: 'required' -> 'true'; add: 'sorted' -> 'true'; add: 'filter' -> 'none'; add: 'key' -> 'value'; yourself)).