accessing
path
	| path |
	path := self requestContext request url path last.
	^ path = input
		ifTrue: [ path ]
		ifFalse: [ 'fail!' ]