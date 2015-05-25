tests-events
testEventsAjax
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
		equals: self function , '("a").ajaxError(function(){mock})'