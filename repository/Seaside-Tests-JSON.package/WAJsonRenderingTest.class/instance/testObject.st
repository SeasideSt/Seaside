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

	self
		should: [
				self
					assert: [ :json |
						json object: [
							json key: 1 value: 1 ] ]
					gives: '{"1": 1}' ]
		raise: WAJsonSyntaxError.

	[ 
		WAJsonKeyValueBrush stringKeysOnly: false.
		self
			assert: [ :json |
				json object: [
					json key: 1 value: 1 ] ]
			gives: '{1: 1}' 
	] ensure: [  WAJsonKeyValueBrush stringKeysOnly: true ]