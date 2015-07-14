public
keyFromContext: aRequestContext
	"If a query field is present it overrides a session id.
	In the case of a document handler both a session id and a query field are present with different values
	(the session id 'pointing' to the session and the query field 'pointing' to the document handler).
	We have to take the document handler in this case."
	| key |
	key := self queryFieldKeyFromContext: aRequestContext.
	^ key isNil
		ifTrue: [ self sessionIdFromContext: aRequestContext ]
		ifFalse: [ key ]