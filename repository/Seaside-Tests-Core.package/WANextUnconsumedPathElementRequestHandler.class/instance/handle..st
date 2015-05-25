handling
handle: aRequestContext
	| consumer |
	consumer := aRequestContext consumer.
	nextUnconsumedPathElement := consumer atEnd
		ifTrue: [ nil ]
		ifFalse: [ aRequestContext consumer peek ].
	super handle: aRequestContext