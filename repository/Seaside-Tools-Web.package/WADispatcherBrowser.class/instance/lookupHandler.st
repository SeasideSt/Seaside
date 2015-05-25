actions
lookupHandler
	| consumer requesthandler |
	consumer := self requestContext consumer.
	requesthandler := self dispatcher.
	[ consumer atEnd ] whileFalse: [
		requesthandler := requesthandler isDispatcher
				ifFalse: [ ^ requesthandler ]
				ifTrue: [
					requesthandler handlers 
						at: consumer next
						ifAbsent: [ ^ nil ] ] ].
	^ requesthandler