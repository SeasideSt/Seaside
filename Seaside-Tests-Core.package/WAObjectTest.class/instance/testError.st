tests
testError
	"Make sure #error: signals a subclass of WAError."
	
	self should: [ WAObject new error: 'oh dear' ] raise: WAError.
	self should: [ WAObject error: 'oh dear' ] raise: WAError