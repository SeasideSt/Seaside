tests
testNestedArray
	self
		assert: [ :json |
			json array: [
				json
					value: 1;
					value: [
						json array: [
							json value: '1' ] ];
					value: 2 ] ]
		gives: '[1, ["1"], 2]'.
	self
		assert: [ :json |
			json array: [
				json array: [
					json value: 1 ] ] ] 
		gives: '[[1]]'