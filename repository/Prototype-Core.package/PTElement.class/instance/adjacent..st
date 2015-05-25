enumerating
adjacent: aString
	"Finds all siblings of the current element that match the given selector(s)."

	^ self call: 'adjacent' with: aString; enumerator