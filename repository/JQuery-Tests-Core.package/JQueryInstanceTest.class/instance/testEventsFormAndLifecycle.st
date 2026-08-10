tests-events
testEventsFormAndLifecycle
	self
		assert: ((self jQuery: 'a') onBlur: self mock)
		equals: self function , '("a").on("blur",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onChange: self mock)
		equals: self function , '("a").on("change",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onError: self mock)
		equals: self function , '("a").on("error",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onFocus: self mock)
		equals: self function , '("a").on("focus",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onFocusOut: self mock)
		equals: self function , '("a").on("focusout",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onFocusIn: self mock)
		equals: self function , '("a").on("focusin",function(){mock})'.
	self
 		assert: ((self jQuery: 'a') onInput: self mock)
 		equals: self function , '("a").on("input",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onLoad: self mock)
		equals: self function , '("a").on("load",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onResize: self mock)
		equals: self function , '("a").on("resize",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onScroll: self mock)
		equals: self function , '("a").on("scroll",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onSelect: self mock)
		equals: self function , '("a").on("select",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onSubmit: self mock)
		equals: self function , '("a").on("submit",function(){mock})'.
	self
		assert: ((self jQuery: 'a') onUnload: self mock)
		equals: self function , '("a").on("unload",function(){mock})'