accessing
at: aKey append: aValue
	"Append aValue to the attribute aKey. If already present, concatenate it with a space. Ignore the request if aValue is nil."

	^ self at: aKey append: aValue separator: ' '