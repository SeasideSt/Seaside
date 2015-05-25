rendering
renderValuesOn: html
	self renderLabel: 'VM Version' value: (self image getSystemAttribute: 1004) on: html.
	self renderLabel: 'VM Type' value: ((self image vmParameterAt: 40) * 8) printString, 'bit' on: html.
	self renderLabel: 'Endianness' value: self image endianness on: html.
	
	self renderLabel: 'Image Path' value: (self image getSystemAttribute: 1) on: html.
	
	self renderLabel: 'Document to Open' value: (self image getSystemAttribute: 2) on: html.
	self renderLabel: 'VM Options' value: (self vmOptionsFrom: self image) on: html.
	
	self renderLabel: 'Command Line Arguments' value: (self commandLineArgumentsFrom: self image) on: html.
	self
		renderLabel: 'Builtin Modules'
		value: [
			html unorderedList list: self image listBuiltinModules ]
		on: html.
	self
		renderLabel: 'Loaded Modules'
		value: [
			html unorderedList list: self image listLoadedModules ]
		on: html