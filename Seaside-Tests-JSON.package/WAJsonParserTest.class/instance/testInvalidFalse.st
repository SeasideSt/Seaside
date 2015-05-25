tests-invalid
testInvalidFalse
	self assertInvalid: 'fa'.
	self assertInvalid: 'falsely'.
	self assertInvalid: 'fabulous'