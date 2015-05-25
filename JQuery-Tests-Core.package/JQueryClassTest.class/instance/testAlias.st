tests
testAlias
	| originalName |
	originalName := JQuery functionName.
	JQuery functionName: 'WhatElse'.
	[ self assert: self jQuery equals: 'WhatElse' ]
		ensure: [ JQuery functionName: originalName ]