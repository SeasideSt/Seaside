accessing-headers
headerAt: aString append: aValue 
	"Appends a response header with aString and aValue. This method allows response headers to have multiple values."
	^ self headers 
		at: aString
		add: aValue greaseString