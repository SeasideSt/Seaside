initialization
registerCallbackIn: aCallbackStore
	self addParameter: (aCallbackStore store: (JSAjaxCallback on: [ self process ]))