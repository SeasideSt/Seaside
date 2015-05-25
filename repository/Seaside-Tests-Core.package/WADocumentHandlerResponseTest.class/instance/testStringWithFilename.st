tests
testStringWithFilename
	self
		createAndVerifyTextDocumentNamed: 'toolbar.css'
		hasAttachment: 'attachment; filename="toolbar.css"'