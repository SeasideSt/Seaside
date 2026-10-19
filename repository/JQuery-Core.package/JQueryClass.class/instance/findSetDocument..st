utilities
findSetDocument: anObject
	"Set selector document context via jQuery.find.setDocument."

	self
		access: 'find';
		call: 'setDocument' with: anObject