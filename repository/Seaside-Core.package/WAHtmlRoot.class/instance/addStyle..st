adding
addStyle: aString
	"Include the style-sheet aString into the receiver."

	styles ifNil: [ styles := Set new ].
	styles add: aString