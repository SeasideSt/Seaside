navigation
previous: aString at: anInteger 
	"Returns element's previous sibling (or the index anInteger-th one, if anInteger is specified) that matches the css rule aString. If no aString is provided, all previous siblings are considered. If no previous sibling matches these criteria, undefined is returned."
	
	self call: 'previous' withArguments: (self rule: aString at: anInteger)