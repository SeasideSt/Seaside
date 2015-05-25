tests
testCrLf
	| crlf testValue |
	crlf := String with: Character cr with: Character lf.
	testValue := 'value', crlf, 'Location: www.bad.com', crlf, crlf.
	self
		should: [
			collection add: 'key' -> testValue ]
		raise: WAInvalidHeaderValueError.
	self
		should: [
			collection addAll: (Dictionary new
				add: 'key' -> testValue;
				yourself) ]
		raise: WAInvalidHeaderValueError.
	self
		should: [
			collection at: 'key' add: testValue ]
		raise: WAInvalidHeaderValueError.
	self
		should: [
			collection at: 'key' add: testValue ]
		raise: WAInvalidHeaderValueError.
	self
		should: [
			collection at: 'key' put: testValue ]
		raise: WAInvalidHeaderValueError
	