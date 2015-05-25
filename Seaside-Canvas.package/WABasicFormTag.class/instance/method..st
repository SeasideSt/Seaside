attributes
method: aString 
	"This attribute specifies which HTTP method will be used to submit the form data set. Possible (case-insensitive) values are 'get' (the default) and 'post'."
	self attributes 
		at: 'method'
		put: aString