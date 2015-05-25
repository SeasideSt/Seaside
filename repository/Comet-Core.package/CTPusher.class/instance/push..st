protected
push: aString
	"Push aString to all associated handlers."

	self mutex critical: [ handlers := handlers select: [ :each | each push: aString ] ]