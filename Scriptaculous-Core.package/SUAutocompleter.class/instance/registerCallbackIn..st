initialization
registerCallbackIn: aCallbackStore
	self paramName: (aCallbackStore store: (JSAjaxCallback on: [ :v | self processWith: v ]))