testing
testTextOnly
	self
		assert: [ :html | html text: 'Seaside' ]
		gives: 'Seaside'