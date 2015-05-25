writing-private
writeSecureOn: aStream
	self secure
		ifTrue: [ aStream nextPutAll: '; Secure' ]