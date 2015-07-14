private
isImplemented: aString
	"Answer whether the receiver implements the given HTTP method."

	^ #('GET' 'POST') includes: aString