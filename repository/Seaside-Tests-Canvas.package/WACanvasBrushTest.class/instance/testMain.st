tests-tags
testMain
	self
		assert: [ :html | html main ]
		gives: '<main></main>'.
	self
		assert: [ :html | html main: 'test' ]
		gives: '<main>test</main>'.
	self
		assert: [ :html | html main with:[ html text: 'test' ] ]
		gives: '<main>test</main>'.