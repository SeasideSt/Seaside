attributes
pattern: aString
	"no known browser support
	
	For the text, password, email, and url types of the input element, and for the textarea element, the pattern attribute specifies a pattern that the control value must match. 

When specified, the pattern attribute contains a regular expression that the control's value must match before the form may be submitted.

	The regular expression language used for this attribute is the same as that defined in [ECMA262], except that the pattern attribute must match the entire value, not just any subset (somewhat as if it implied a ^(?: at the start of the pattern and a )$ at the end). The pattern must be compiled with the global, ignoreCase, and multiline flags disabled (see ECMA262, sections 15.10.7.2 through 15.10.7.4). If the attribute is omitted then the control has no pattern restriction.
	
	The / character is not special in the pattern attribute. The two attributes pattern='/etc/.+' and pattern='\/etc\/.+' are therefore equivalent. 

	In the case of the email and url types, the pattern attribute specifies a pattern that must be matched in addition to the value matching the generic pattern relevant for the control."
	self attributeAt: 'pattern' put: aString