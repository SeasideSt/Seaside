rendering
renderCogValuesOn: html

	self
		renderLabel: 'Size of machine code zone'
		value:  (self printMemory: (self image vmParameterAt: 46)) on: html.
	self
		renderLabel: 'Desired size of machine code zone'
		value:  (self printMemory: (self image vmParameterAt: 47)) on: html.
	
	self
		renderLabel: 'Compiled code compactions since startup'
		value: (self image vmParameterAt: 62) on: html.
	self
		renderLabel: 'Time spent on compiled code compactions since startup'
		value: (self  printMilliSeconds: (self image vmParameterAt: 63)) on: html.