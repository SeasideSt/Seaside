private
assertDefault: aResponse
	"Instead of returning 404 on a default request as WARegistry does, WAApplication creates a new
	Session and dispatches to it."
	self assert: registry cache size = (registrySize + 1).
	self assert: aResponse status = 200.
	self assert: (aResponse contents beginsWithSubCollection: 'start:')