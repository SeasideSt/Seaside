public
keyFromContext: aRequestContext
	"If a query field is present it overrides a cookie."
	| key |
	key := self queryFieldKeyFromContext: aRequestContext.
	^ key isNil
		ifTrue: [ (self cookieFromContext: aRequestContext ifAbsent: [ ^ nil ]) value ]
		ifFalse: [ key ]