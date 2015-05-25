accessing
stringify: anObject replacer: aReplacer space: aSpace
	"Serialize anObject as a JSON string. aReplacer is an optional parameter that determines how object values are stringified for objects. It can be a function or an array of strings. aSpace is an optional parameter that specifies the indentation of nested structures. If it is omitted, the text will be packed without extra whitespace."

	self call: 'stringify' with: anObject with: aReplacer with: aSpace