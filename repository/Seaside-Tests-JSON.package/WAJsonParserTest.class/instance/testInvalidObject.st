tests-invalid
testInvalidObject
	self assertInvalid: '{'.
	self assertInvalid: '{"a"'.
	self assertInvalid: '{"a":'.
	self assertInvalid: '{"a":"b"'.
	self assertInvalid: '{"a":"b",'.
	self assertInvalid: '{"a"}'.
	self assertInvalid: '{"a":}'.
	self assertInvalid: '{"a":"b",}'.
	self assertInvalid: '{}}'.
	self assertInvalid: '{1:"a"}'