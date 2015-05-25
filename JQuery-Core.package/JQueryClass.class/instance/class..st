convenience
class: aString 
	"Answer a jQuery that matches all DOM elements with the CLASS aString."

	^ self expression: '.' , aString greaseString