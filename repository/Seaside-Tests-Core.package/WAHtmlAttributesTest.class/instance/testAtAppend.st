tests
testAtAppend
	self
		assert: [ :attr | attr at: 'onclick' append: 'this' separator: ';' ]
		gives: ' onclick="this"'.
	self
		assert: [ :attr |
			attr
				at: 'onclick' append: 'this' separator: ';';
				at: 'onclick' append: 'that' separator: ';' ]
		gives: ' onclick="this;that"'.
	self
		assert: [ :attr |
			attr
				at: 'onclick' append: 'this' separator: ';';
				at: 'onclick' append: nil separator: ';' ]
		gives: ' onclick="this"'.
	self
		assert: [ :attr |
			attr
				at: 'onclick' append: 1 separator: ';';
				at: 'onclick' append: 2 separator: ';' ]
		gives: ' onclick="1;2"'