tests
testParameterMatchingMixedParameters
	| route parameters |
	route := WARoute get: '/{1}/_all_docs?rev={2}&uuids=true' selector: #a:b:.
	self deny: (route matchesParameters: Dictionary new).
	parameters := Dictionary new at: 'rev' put: '5'; yourself.
	self deny: (route matchesParameters: parameters).
	parameters at: 'uuids' put: 'true'.
	self assert: (route matchesParameters: parameters).
	parameters at: 'phpsessionid' put: '32432'.
	self deny: (route matchesParameters: Dictionary new).
	parameters removeKey: 'phpsessionid'.
	self assert: (route matchesParameters: parameters).
	parameters at: 'uuids' put: 'false'.
	self deny: (route matchesParameters: parameters)