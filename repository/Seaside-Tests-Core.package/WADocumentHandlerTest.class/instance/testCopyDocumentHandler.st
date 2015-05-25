tests
testCopyDocumentHandler
	| copy |
	copy := handler copy.
	self assert: copy = handler.
	self deny: copy == handler.
	self assert: copy document = handler document.
	self deny: copy document == handler document