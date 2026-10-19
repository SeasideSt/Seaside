utilities
findTokenize: aString
	"Tokenize a selector string using jQuery.find.tokenize."

	self
		access: 'find';
		call: 'tokenize' with: aString