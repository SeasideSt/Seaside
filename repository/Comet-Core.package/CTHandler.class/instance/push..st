actions
push: aString
	"Push aString to the receiver. Notify the session about the update, so that it does not timeout. Answer true, if the connection is still valid."

	| success |
	response isNil
		ifTrue: [ ^ false ].
	success := [ response nextPutAll: aString; flushComet ]
		on: Error
		do: [ :err | ^ false ].
	success
		ifTrue: [ self notifySession ].
	^ success