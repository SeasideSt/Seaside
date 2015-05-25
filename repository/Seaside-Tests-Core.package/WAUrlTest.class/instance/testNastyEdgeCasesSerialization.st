tests-encoding
testNastyEdgeCasesSerialization
	url host: 'example.com'.
	url addToPath: 'blue+light blue'.
	url queryFields at: 'blue+light blue' put: nil.
	"legal but hardcore
	self assert: url greaseString = 'http://example.com/blue+light%20blue?blue%2Blight+blue'"
	self assert: url greaseString = 'http://example.com/blue%2Blight%20blue?blue%2Blight%20blue'