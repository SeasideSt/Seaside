tests
testBasic
	self
		assert: [ :xml |
        xml
            tag: 'the-tag'
            with: 'the-content' ]
		gives: '<the-tag>the-content</the-tag>'