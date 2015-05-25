tests
testCharCodingWithHandler
	"569: Encoding information doesn't get included in the response"
	self
		assert: [ :html |
			html basicForm ]
		gives: '<form accept-charset="iso-8859-1" method="post" action="/"></form>'
