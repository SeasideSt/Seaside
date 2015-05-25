tests
testNestedObject
	self
		assert: [ :json |
			json object: [
				json
					key: 'a' value: 'b';
					key: '1' value: [
						json object: [
							json key: '2' value: 2 ] ];
					key: 'c' value: 'd' ] ]
		gives: '{"a": "b", "1": {"2": 2}, "c": "d"}'