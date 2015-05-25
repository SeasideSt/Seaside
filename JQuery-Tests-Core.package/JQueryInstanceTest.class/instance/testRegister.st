tests-events
testRegister
	self
		assert: ((self jQuery: 'a') onAjaxSuccess: self mock)
		equals: self function , '("a").ajaxSuccess(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onAjaxComplete: self mock)
		equals: self function , '("a").ajaxComplete(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onAjaxSend: self mock)
		equals: self function , '("a").ajaxSend(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onAjaxStart: self mock)
		equals: self function , '("a").ajaxStart(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onAjaxStop: self mock)
		equals: self function , '("a").ajaxStop(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onAjaxError: self mock)
		equals: self function , '("a").ajaxError(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onBlur: self mock)
		equals: self function , '("a").blur(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onChange: self mock)
		equals: self function , '("a").change(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onClick: self mock)
		equals: self function , '("a").click(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onDoubleClick: self mock)
		equals: self function , '("a").dblclick(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onError: self mock)
		equals: self function , '("a").error(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onFocus: self mock)
		equals: self function , '("a").focus(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onKeyDown: self mock)
		equals: self function , '("a").keydown(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onKeyPress: self mock)
		equals: self function , '("a").keypress(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onKeyUp: self mock)
		equals: self function , '("a").keyup(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onLoad: self mock)
		equals: self function , '("a").load(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseDown: self mock)
		equals: self function , '("a").mousedown(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseEnter: self mock)
		equals: self function , '("a").mouseenter(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseLeave: self mock)
		equals: self function , '("a").mouseleave(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseMove: self mock)
		equals: self function , '("a").mousemove(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseOut: self mock)
		equals: self function , '("a").mouseout(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseOver: self mock)
		equals: self function , '("a").mouseover(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onMouseUp: self mock)
		equals: self function , '("a").mouseup(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onResize: self mock)
		equals: self function , '("a").resize(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onScroll: self mock)
		equals: self function , '("a").scroll(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onSelect: self mock)
		equals: self function , '("a").select(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onSubmit: self mock)
		equals: self function , '("a").submit(function(){mock})'.
	self
		assert: ((self jQuery: 'a') onUnload: self mock)
		equals: self function , '("a").unload(function(){mock})'