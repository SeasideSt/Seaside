tests-attributes
testKeyboardAttributes
	self
		assert: [ :html | html anchor accessKey: $a ]
		gives: '<a accesskey="a"></a>'.
	self
		assert: [ :html | html anchor tabIndex: 3 ]
		gives: '<a tabindex="3"></a>'