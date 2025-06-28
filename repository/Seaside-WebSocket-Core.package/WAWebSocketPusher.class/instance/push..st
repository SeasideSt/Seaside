protected
push: aString
	"Push aString to all associated handlers."

	self socketsDo:[ :socket |
		socket isConnected ifTrue:[ socket send: aString ] ]