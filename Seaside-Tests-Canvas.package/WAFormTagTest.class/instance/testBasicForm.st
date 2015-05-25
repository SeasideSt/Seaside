tests
testBasicForm
	self
		assert: [ :html |
			html basicForm ]
		gives: '<form accept-charset="utf-8" method="post" action="/"></form>'
