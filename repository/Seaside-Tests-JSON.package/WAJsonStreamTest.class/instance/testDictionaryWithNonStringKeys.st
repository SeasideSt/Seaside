tests
testDictionaryWithNonStringKeys
	
	self
		should: [
			(Dictionary new
				 at: #( 1 2 ) put: 'awkward';
				 yourself) asJson ]
		raise: WAJsonSyntaxError.
		
	self
		should: [
			((Dictionary new)
				at: 1 put: 'not-a-string';
				yourself) asJson ]
		raise: WAJsonSyntaxError