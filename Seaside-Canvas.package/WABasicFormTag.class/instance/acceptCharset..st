attributes
acceptCharset: aString 
	"This attribute specifies the list of character encodings for input data that is accepted by the server processing this form. The value is a space- and/or comma-delimited list of charset values. The client must interpret this list as an exclusive-or list, i.e., the server is able to accept any single character encoding per entity received.

The default value for this attribute is the reserved string 'UNKNOWN'. User agents may interpret this value as the character encoding that was used to transmit the document containing this FORM element."
	self attributes 
		at: 'accept-charset'
		put: aString