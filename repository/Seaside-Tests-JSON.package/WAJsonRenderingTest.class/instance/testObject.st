tests
testObject
	self
		assert: [ :json |
			json object: [
				json
					key: '1' value: '1';
					key: '2' value: 2 ] ]
		gives: '{"1": "1", "2": 2}'.
	self
		assert: [ :json |
			json object: [
				json key: '1' value: 1 ] ]
		gives: '{"1": 1}'.

	WAJsonKeyValueBrush stringKeysOnly: true.
	self
		should: [
				self
					assert: [ :json |
						json object: [
							json key: 1 value: 1 ] ]
					gives: '{"1": 1}' ]
		raise: Error
		whoseDescriptionIncludes: 'Only Strings can be used as keys in JSON objects.'
		description: 'Throw an error when serializing dictionaries with non-String keys'
	

	