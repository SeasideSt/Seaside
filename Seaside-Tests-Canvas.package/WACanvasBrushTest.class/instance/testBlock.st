tests-tags
testBlock
	self
		assert: [ :html | html strong: [ html text: 'nes'; text: 'sie' ] ]
		gives: '<strong>nessie</strong>'.
	self
		assert: [ :html | html strong: [ :html2 | html2 text: 'nes'; text: 'sie' ] ]
		gives: '<strong>nessie</strong>'