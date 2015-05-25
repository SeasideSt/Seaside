tests
testIssue655
	"Regression test for Issue 655 where java.net.HttpURLConnection would provide fucked up headers."
	| mimeType |
	mimeType := WAMimeType fromString: '*; q=.2'.
	self assert: mimeType main = '*'.
	self assert: mimeType sub = '*'.
	self assert: (mimeType parameters at: 'q') = '.2'.
	
	mimeType := WAMimeType fromString: '*'.
	self assert: mimeType main = '*'.
	self assert: mimeType sub = '*'.
	self assert: (mimeType parameters at: 'q' ifAbsent: [ nil ]) isNil