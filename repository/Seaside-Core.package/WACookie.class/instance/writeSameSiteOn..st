writing-private
writeSameSiteOn: aStream
	sameSite isNil
		ifTrue: [ ^ self ].
	aStream
		nextPutAll: '; SameSite=';
		nextPutAll: sameSite