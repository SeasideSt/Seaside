public
keyFromContext: aRequestContext
	"If a query field is present it overrides a cookie.
	In the case of a document handler both a cookie and a query field are present with different values
	(the cookie 'pointing' to the session and the query field 'pointing' to the document handler).
	We have to take the document handler in this case."
	| key |
	key := self queryFieldKeyFromContext: aRequestContext.
	^ key isNil
		ifTrue: [ (self cookieFromContext: aRequestContext ifAbsent: [ ^ nil ]) value ]
		ifFalse: [ key ]