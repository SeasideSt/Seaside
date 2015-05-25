handling
handleFiltered: aRequestContext
	| key handler |
	key := self trackingStrategy keyFromContext: aRequestContext.
	key isNil
		ifTrue: [
			self handleDefault: aRequestContext ]
		ifFalse: [
			handler := self cache at: key ifAbsent: [ nil ].
			handler isNil
				ifTrue: [
					self trackingStrategy noHandlerFoundForKey: key in: self context: aRequestContext ]
				ifFalse: [
					self handleKeyed: handler with: key context: aRequestContext ] ]