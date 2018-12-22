rendering
renderValuesOn: html
	self renderLabel: 'Operating System' value: (self image vm getSystemAttribute: 1001) on: html.
	self renderLabel: 'Version' value: (self image vm getSystemAttribute: 1002) on: html.
	self renderLabel: 'Processor Type' value: (self image vm getSystemAttribute: 1003) on: html.