tests-events
testEventsAjax
	self
		assert: ((self jQuery: 'a') onAjaxSuccess: self mock)
		equals: self function , '("a").on("ajaxSuccess",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onAjaxComplete: self mock)
		equals: self function , '("a").on("ajaxComplete",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onAjaxSend: self mock)
		equals: self function , '("a").on("ajaxSend",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onAjaxStart: self mock)
		equals: self function , '("a").on("ajaxStart",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onAjaxStop: self mock)
		equals: self function , '("a").on("ajaxStop",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onAjaxError: self mock)
		equals: self function , '("a").on("ajaxError",function(){mock})'
