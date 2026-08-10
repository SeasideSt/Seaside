tests
testSourceUrl
	| script |
	script := ((self jQuery: 'input') autocomplete sourceUrl: '/suggestions') greaseString.
	self assert: (script = (self function , '("input").autocomplete({"source":"/suggestions"})')
		or: [ script = (self function , '("input").autocomplete("option","source","/suggestions")') ])
