tests-conveniance
testStrictTransportSecurity
	self response strictTransportSecurity: 500 includeSubDomains: true.
	self assert: (self response headerAt: 'Strict-Transport-Security') = 'max-age=500; includeSubDomains'.
	
	self response strictTransportSecurity: 500 includeSubDomains: false.
	self assert: (self response headerAt: 'Strict-Transport-Security') = 'max-age=500'