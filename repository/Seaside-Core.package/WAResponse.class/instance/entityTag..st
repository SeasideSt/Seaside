convenience-caching
entityTag: aString
	"The ETag (or entity tag) HTTP response header is an identifier for a specific version of a resource."

	self headerAt: 'ETag' put: aString