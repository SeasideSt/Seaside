testing
testResourceBaseUrlConfigured
	| actualUrl |
	handler preferenceAt: #resourceBaseUrl put: (WAUrl absolute:  '/15/30').
	actualUrl := WATestingFiles default urlOf: #sampleJs using: handler.
	self assert: actualUrl greaseString = '/15/30/WATestingFiles/sample.js'