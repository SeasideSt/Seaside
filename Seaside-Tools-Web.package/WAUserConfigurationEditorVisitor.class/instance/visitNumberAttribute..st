visiting
visitNumberAttribute: anAttribute
	self html textInput
		size: 5;
		callback: [ :value | self configuration takeValueFromString: value forAttribute: anAttribute ];
		value: (anAttribute stringForValue: (self configuration at: anAttribute key))