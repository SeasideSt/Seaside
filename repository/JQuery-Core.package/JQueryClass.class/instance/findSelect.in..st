utilities
findSelect: aString in: anObject
	"Select elements via jQuery.find.select with a selector and context."

	self
		access: 'find';
		call: 'select' with: aString with: anObject