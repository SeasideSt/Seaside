testing
testResourceBaseUrlNotConfigured
	| actualUrl |
	handler preferenceAt: #resourceBaseUrl put: nil.
	actualUrl := WATestingFiles default urlOf: #sampleJs using: handler.
	self assert: actualUrl greaseString = ('/', self handlerName, '/WATestingFiles/sample.js')