actions
overrideAttribute: anAttribute
	self configuration
		takeValue: (self configuration at: anAttribute key)
		forAttribute: anAttribute