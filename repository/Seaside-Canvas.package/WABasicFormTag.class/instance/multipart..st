attributes
multipart: aBoolean
	"Sets the content type used to submit the form to the server.
	true: sets the content type to multipart/form-data
	false: leaves the content type to default application/x-www-form-urlencoded"
	aBoolean ifTrue: [ self multipart ]