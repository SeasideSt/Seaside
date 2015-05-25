writing-private
writeHttpOnlyOn: aStream
	self httpOnly
		ifTrue: [ aStream nextPutAll: '; HttpOnly' ]