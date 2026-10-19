utilities
findCompile: aString
	"Compile a selector string using jQuery.find.compile."

	self
		access: 'find';
		call: 'compile' with: aString