tests
testObjectValues
	self
		assert: [ :json |
			json array: [
				json object: [
					json key: 'name' value: 'WAXmlDocument' ].
				json object: [
					json key: 'name' value: 'WAJsonDocument' ] ] ]
		gives: '[{"name": "WAXmlDocument"}, {"name": "WAJsonDocument"}]'