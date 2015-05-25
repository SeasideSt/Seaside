actions
startValidation
	self call: (WAValidationTestComponent new
		validateWith: [ :value |
			value ifFalse: [
				WAValidationNotification signal: 'Validation Failed!' ] ];
		yourself).
	self inform: 'Validation Suceeded!'