writing-private
writeExpiresOn: aStream
	expiry isNil
		ifTrue: [ ^ self ].
	aStream
		nextPutAll: '; expires=';
		nextPutAll: self expiryString