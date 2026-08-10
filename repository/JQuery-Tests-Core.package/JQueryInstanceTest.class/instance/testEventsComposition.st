tests-events
testEventsComposition
	self
		assert: ((self jQuery: 'a') onCompositionEnd: self mock)
		equals: self function , '("a").on("compositionend",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onCompositionStart: self mock)
		equals: self function , '("a").on("compositionstart",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onCompositionUpdate: self mock)
		equals: self function , '("a").on("compositionupdate",function(){mock})'