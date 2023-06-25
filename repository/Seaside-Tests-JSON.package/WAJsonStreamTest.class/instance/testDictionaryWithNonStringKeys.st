tests
testDictionaryWithNonStringKeys

	WAJsonKeyValueBrush stringKeysOnly: true.
	
	self
		should: [
			(Dictionary new
				 at: #( 1 2 ) put: 'awkward';
				 yourself) asJson ]
		raise: Error
		whoseDescriptionIncludes: 'Only Strings can be used as keys in JSON objects.'
		description: 'Throw an error when serializing dictionaries with non-String keys'.
		
	self
		should: [
			((Dictionary new)
				at: 1 put: 'not-a-string';
				yourself) asJson ]
		raise: Error
		whoseDescriptionIncludes: 'Only Strings can be used as keys in JSON objects.'
		description: 'Throw an error when serializing dictionaries with non-String keys'