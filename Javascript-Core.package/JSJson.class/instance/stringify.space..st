accessing
stringify: anObject space: aSpace
	"Serialize anObject as a JSON string. aSpace is an optional parameter that specifies the indentation of nested structures. If it is omitted, the text will be packed without extra whitespace."

	self call: 'stringify' with: anObject with: aSpace