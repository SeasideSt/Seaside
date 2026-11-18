tests-events
testTriggers
	self
		assert: ((self jQuery: 'a') triggerBlur)
		equals: self function , '("a").trigger("blur")'.
	self
		assert: ((self jQuery: 'a') triggerChange)
		equals: self function , '("a").trigger("change")'.
	self
		assert: ((self jQuery: 'a') triggerClick)
		equals: self function , '("a").trigger("click")'.
	self
		assert: ((self jQuery: 'a') triggerCompositionEnd)
		equals: self function , '("a").trigger("compositionend")'.
	self
		assert: ((self jQuery: 'a') triggerCompositionStart)
		equals: self function , '("a").trigger("compositionstart")'.
	self
		assert: ((self jQuery: 'a') triggerCompositionUpdate)
		equals: self function , '("a").trigger("compositionupdate")'.
	self
		assert: ((self jQuery: 'a') triggerContextMenu)
		equals: self function , '("a").trigger("contextmenu")'.
	self
		assert: ((self jQuery: 'a') triggerCopy)
		equals: self function , '("a").trigger("copy")'.
	self
		assert: ((self jQuery: 'a') triggerCut)
		equals: self function , '("a").trigger("cut")'.
	self
		assert: ((self jQuery: 'a') triggerDoubleClick)
		equals: self function , '("a").trigger("dblclick")'.
	self
		assert: ((self jQuery: 'a') triggerDrag)
		equals: self function , '("a").trigger("drag")'.
	self
		assert: ((self jQuery: 'a') triggerDragEnd)
		equals: self function , '("a").trigger("dragend")'.
	self
		assert: ((self jQuery: 'a') triggerDragEnter)
		equals: self function , '("a").trigger("dragenter")'.
	self
		assert: ((self jQuery: 'a') triggerDragLeave)
		equals: self function , '("a").trigger("dragleave")'.
	self
		assert: ((self jQuery: 'a') triggerDragOver)
		equals: self function , '("a").trigger("dragover")'.
	self
		assert: ((self jQuery: 'a') triggerDragStart)
		equals: self function , '("a").trigger("dragstart")'.
	self
		assert: ((self jQuery: 'a') triggerDrop)
		equals: self function , '("a").trigger("drop")'.
	self
		assert: ((self jQuery: 'a') triggerError)
		equals: self function , '("a").trigger("error")'.
	self
		assert: ((self jQuery: 'a') triggerFocus)
		equals: self function , '("a").trigger("focus")'.
	self
		assert: ((self jQuery: 'a') triggerKeyDown)
		equals: self function , '("a").trigger("keydown")'.
	self
		assert: ((self jQuery: 'a') triggerKeyPress)
		equals: self function , '("a").trigger("keypress")'.
	self
		assert: ((self jQuery: 'a') triggerKeyUp)
		equals: self function , '("a").trigger("keyup")'.
	self
		assert: ((self jQuery: 'a') triggerPaste)
		equals: self function , '("a").trigger("paste")'.
	self
		assert: ((self jQuery: 'a') triggerPointerCancel)
		equals: self function , '("a").trigger("pointercancel")'.
	self
		assert: ((self jQuery: 'a') triggerPointerDown)
		equals: self function , '("a").trigger("pointerdown")'.
	self
		assert: ((self jQuery: 'a') triggerPointerEnter)
		equals: self function , '("a").trigger("pointerenter")'.
	self
		assert: ((self jQuery: 'a') triggerPointerLeave)
		equals: self function , '("a").trigger("pointerleave")'.
	self
		assert: ((self jQuery: 'a') triggerPointerMove)
		equals: self function , '("a").trigger("pointermove")'.
	self
		assert: ((self jQuery: 'a') triggerPointerOut)
		equals: self function , '("a").trigger("pointerout")'.
	self
		assert: ((self jQuery: 'a') triggerPointerOver)
		equals: self function , '("a").trigger("pointerover")'.
	self
		assert: ((self jQuery: 'a') triggerPointerUp)
		equals: self function , '("a").trigger("pointerup")'.
	self
		assert: ((self jQuery: 'a') triggerSelect)
		equals: self function , '("a").trigger("select")'.
	self
		assert: ((self jQuery: 'a') triggerSubmit)
		equals: self function , '("a").trigger("submit")'.
	self
		assert: ((self jQuery: 'a') triggerWheel)
		equals: self function , '("a").trigger("wheel")'