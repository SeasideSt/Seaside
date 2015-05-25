tests
testSpecialFloats
	"Tests that float values that can't be represented as JSON objects are null
	http://code.google.com/p/seaside/issues/detail?id=730
	http://ecma-international.org/ecma-262/5.1/#sec-15.12.3"
	self
		assert: [ :json |
			json array: [
				json
					value: Float infinity;
					value: Float infinity * -1;
					value: Float nan ] ]
		gives: '[null, null, null]'