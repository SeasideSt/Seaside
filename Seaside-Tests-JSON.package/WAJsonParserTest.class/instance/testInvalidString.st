tests-invalid
testInvalidString
	self assertInvalid: '"'.
	self assertInvalid: '"a'.
	self assertInvalid: '"\"'.
	self assertInvalid: '"\a"'.
	self assertInvalid: '"\u"'.
	self assertInvalid: '"\u1"'.
	self assertInvalid: '"\u12"'.
	self assertInvalid: '"\u123"'.
	self assertInvalid: '"\u123x"'