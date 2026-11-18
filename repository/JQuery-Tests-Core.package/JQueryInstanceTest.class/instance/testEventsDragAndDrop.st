tests-events
testEventsDragAndDrop
	self
		assert: ((self jQuery: 'a') onDrag: self mock)
		equals: self function , '("a").on("drag",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onDragEnd: self mock)
		equals: self function , '("a").on("dragend",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onDragEnter: self mock)
		equals: self function , '("a").on("dragenter",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onDragLeave: self mock)
		equals: self function , '("a").on("dragleave",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onDragOver: self mock)
		equals: self function , '("a").on("dragover",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onDragStart: self mock)
		equals: self function , '("a").on("dragstart",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onDrop: self mock)
		equals: self function , '("a").on("drop",function(){mock})'