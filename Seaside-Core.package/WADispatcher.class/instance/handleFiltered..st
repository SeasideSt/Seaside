handling
handleFiltered: aRequestContext
	| consumer |
	consumer := aRequestContext consumer.
	consumer atEnd
		ifTrue: [ self handleDefault: aRequestContext ]
		ifFalse: [ self handleFiltered: aRequestContext named: consumer next ]