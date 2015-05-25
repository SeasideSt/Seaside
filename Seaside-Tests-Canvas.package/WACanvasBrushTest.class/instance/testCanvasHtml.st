tests-encoding
testCanvasHtml
	self assert: [ :html | html html: '<' ] gives: '<'.
	self assert: [ :html | html html: '>' ] gives: '>'.
	self assert: [ :html | html html: '"' ] gives: '"'.
	self assert: [ :html | html html: '&' ] gives: '&'.
	self
		assert: [ :html | html html: '<div title="&amp;">' ]
		gives: '<div title="&amp;">'