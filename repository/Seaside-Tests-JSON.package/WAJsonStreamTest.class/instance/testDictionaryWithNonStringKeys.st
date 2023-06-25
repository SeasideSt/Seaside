tests
testDictionaryWithNonStringKeys

	WAJsonKeyValueBrush stringKeysOnly: true.
	
	self
		should: [
			(Dictionary new
				 at: #( 1 2 ) put: 'awkward';
				 yourself) asJson ]
		raise: Error
		withExceptionDo: [ :e | self assert: e messageText equals: 'Only Strings can be used as keys in JSON objects.' ].
		
	self
		should: [
			((Dictionary new)
				at: 1 put: 'not-a-string';
				yourself) asJson ]
		raise: Error
		withExceptionDo: [ :e | self assert: e messageText equals: 'Only Strings can be used as keys in JSON objects.' ].