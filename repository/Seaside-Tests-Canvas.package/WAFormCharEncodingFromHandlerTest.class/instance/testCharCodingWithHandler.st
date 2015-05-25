tests
testCharCodingWithHandler
	"445:WABasicFormTag does not honour character encoding setting"
	self
		assert: [ :html |
			html basicForm ]
		gives: '<form accept-charset="utf-16" method="post" action="/"></form>'
