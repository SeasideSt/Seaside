adding
addScript: aString
	"Include the script aString into the receiver."

	scripts ifNil: [ scripts := Set new ].
	scripts add: aString