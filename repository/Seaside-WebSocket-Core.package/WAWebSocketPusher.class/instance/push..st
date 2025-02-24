protected
push: aString
	"Push aString to all associated handlers."

	self mutex critical: [ (sockets := sockets select: [ :each | each isConnected ]) do:[ :each | each send: aString ] ]