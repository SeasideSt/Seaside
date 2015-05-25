tests-invalid
testInvalidArray
	self assertInvalid: '['.
	self assertInvalid: '[1'.
	self assertInvalid: '[1,'.
	self assertInvalid: '[1,]'.
	self assertInvalid: '[1 2]'.
	self assertInvalid: '[]]'