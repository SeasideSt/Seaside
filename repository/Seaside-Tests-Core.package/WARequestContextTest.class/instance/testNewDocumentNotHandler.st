tests
testNewDocumentNotHandler
	"regression test for
	http://code.google.com/p/seaside/issues/detail?id=653"
	| context document |
	context := self createRequestContext.
	document := context newDocument.
	self assert: document notNil