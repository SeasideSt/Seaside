initialization
initialize
	| charSet |
	super initialize.
	charSet := self requestContext charSet.
	charSet isNil
		ifTrue: [ self acceptCharset: self defaultUrlCharset ]
		ifFalse: [ self acceptCharset: charSet ]