utilities
assertInvalid: aString
	self should: [ self parse: aString ] raise: WAJsonSyntaxError