visiting
visitStringAttribute: anAttribute
	self html textInput
		value: (anAttribute stringForValue: (self configuration at: anAttribute key));
		callback: [ :value | self configuration takeValueFromString: value forAttribute: anAttribute ]