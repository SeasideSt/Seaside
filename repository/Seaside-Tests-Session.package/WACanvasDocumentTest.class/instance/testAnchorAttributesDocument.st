tests-tags-anchors
testAnchorAttributesDocument
	self
		assert: [ :html | html anchor document: 'income: 1$' mimeType: 'text/plain' fileName: 'taxes.txt' ]
		gives: '<a type="text/plain" href="/?_s=1&amp;_d=1"></a>'.
	self
		assert: [ :html | html anchor document: 'income: 1$' mimeType: 'text/plain' ]
		gives: '<a type="text/plain" href="/?_s=1&amp;_d=2"></a>'.
	self
		assert: [ :html | html anchor document: 'income: 1$' ]
		gives: '<a href="/?_s=1&amp;_d=3"></a>'
