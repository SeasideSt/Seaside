private
assertHttpResponseFrom: aResponse matches: aHandler
	| expectedContents actualContents |
	self assert: aResponse status = 200.
	self assert: aResponse contentType = aHandler document mimeType.
	expectedContents := aHandler document contents.
	actualContents := aResponse contents.
	self assert: actualContents size = expectedContents size.
	self assert: actualContents species = expectedContents species.
	self assert: aResponse cookies isEmpty