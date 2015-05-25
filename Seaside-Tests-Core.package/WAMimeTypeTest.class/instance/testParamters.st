tests
testParamters
	^ #('text/html;charset=utf-8' 'text/html; charset=utf-8' ) do: [ :each | 
		| mimeType |
		mimeType := WAMimeType fromString: each.
		self assert: mimeType main = 'text'.
		self assert: mimeType sub = 'html'.
		self assert: mimeType parameters size = 1.
		self assert: (mimeType parameters at: 'charset') = 'utf-8'.
		self assert: mimeType greaseString = 'text/html;charset=utf-8' ]