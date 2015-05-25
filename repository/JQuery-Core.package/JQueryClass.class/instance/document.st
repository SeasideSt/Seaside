convenience
document
	"Answer a jQuery object with the document DOM element."
	
	^ self expression: (JSStream on: 'document')