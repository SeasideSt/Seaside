rendering
renderCogValuesOn: html

	self
		renderLabel: 'Size of machine code zone'
		value:  (self printMemory: (self vm parameterAt: 46)) on: html.
	self
		renderLabel: 'Desired size of machine code zone'
		value:  (self printMemory: (self vm parameterAt: 47)) on: html.
	
	self
		renderLabel: 'Compiled code compactions since startup'
		value: (self vm parameterAt: 62) on: html.
	self
		renderLabel: 'Time spent on compiled code compactions since startup'
		value: (self  printMilliSeconds: (self vm parameterAt: 63)) on: html