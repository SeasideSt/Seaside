accessing-cookies
cookiesAt: aKey
	"Answer all the cookies with the given key."
	
	^ self cookies
		select: [ :each | each key = aKey ]