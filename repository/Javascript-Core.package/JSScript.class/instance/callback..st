convenience
callback: aBlock
	self goto: (self renderContext actionUrl
		withField: (self renderContext callbacks store: (WAActionCallback on: aBlock)))