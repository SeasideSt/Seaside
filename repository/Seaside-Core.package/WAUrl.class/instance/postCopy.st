copying
postCopy
	super postCopy.
	path := path copy.
	queryFields := queryFields copy.
	pathParameters := pathParameters copy