public
keyFromContext: aRequestContext
	"If a query field is present it overrides a session id."
	| key |
	key := self queryFieldKeyFromContext: aRequestContext.
	^ key isNil
		ifTrue: [ self sessionIdFromContext: aRequestContext ]
		ifFalse: [ key ]