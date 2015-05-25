visiting
visitUrlAttribute: anAttribute
	self html textInput
		size: 40;
		callback: [ :value | self configuration takeValueFromString: value forAttribute: anAttribute ];
		value: (anAttribute stringForValue: (self configuration at: anAttribute key))