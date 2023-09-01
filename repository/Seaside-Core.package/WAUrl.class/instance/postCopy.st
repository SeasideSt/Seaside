copying
postCopy
	super postCopy.
	path := path ifNotNil: [ :p | p copy ].
	queryFields := queryFields ifNotNil: [ :f | f copy ].
	pathParameters := pathParameters ifNotNil: [ :p | p copy ]