tests
testArray
	self
		assert: [ :json |
			json array: [
				json
					value: 1;
					value: '1';
					value: true;
					value: false;
					value: nil ] ]
		gives: '[1, "1", true, false, null]'.
	self
		assert: [ :json |
			json array: [
				json value: 1 ] ]
		gives: '[1]'