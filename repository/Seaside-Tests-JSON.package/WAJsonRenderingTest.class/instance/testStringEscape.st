tests
testStringEscape
	self
		assert: [ :json |
			json array: [
				json value: '"\/' ] ]
		gives: '["\"\\/"]'