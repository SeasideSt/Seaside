visiting
visitPasswordAttribute: anAttribute
	self html passwordInput 
		callback: [ :value | self configuration takeValueFromString: value forAttribute: anAttribute ]