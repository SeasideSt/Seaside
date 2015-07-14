accessing
userinfo
	"Answer the userinfo part of the URL. We store user and password seperately,
	even though the format 'user:password' is deprecated for userinfo in RFC 3986,
	because otherwise it is impossible to figure out correct encoding when userinfo
	data has a colon in it."

	^ password isNil
		ifTrue: [ user ]
		ifFalse: [ String streamContents: [ :stream |
			stream
				nextPutAll: user;
				nextPut: $:;
				nextPutAll: password ] ]