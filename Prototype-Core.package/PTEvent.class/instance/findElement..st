querying
findElement: aString 
	"Returns the first DOM element with a given tag name, upwards from the one on which the event occurred."
	self 
		call: 'findElement'
		with: self event
		with: aString