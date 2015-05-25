accessing
stringify: anObject replacer: aReplacer
	"Serialize anObject as a JSON string. aReplacer is an optional parameter that determines how object values are stringified for objects. It can be a function or an array of strings."

	self call: 'stringify' with: anObject with: aReplacer