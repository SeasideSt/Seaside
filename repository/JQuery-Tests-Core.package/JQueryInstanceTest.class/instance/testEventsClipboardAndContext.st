tests-events
testEventsClipboardAndContext
	self
		assert: ((self jQuery: 'a') onContextMenu: self mock)
		equals: self function , '("a").on("contextmenu",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onCopy: self mock)
		equals: self function , '("a").on("copy",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onCut: self mock)
		equals: self function , '("a").on("cut",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onPaste: self mock)
		equals: self function , '("a").on("paste",function(){mock})'