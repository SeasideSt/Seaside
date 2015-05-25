*seaside-tests-internetexplorer
testForceSafe
	self response forceSafe.
	self assert: (self response headerAt: 'X-Download-Options') = 'noopen'.
	self assert: (self response headers size) = 1