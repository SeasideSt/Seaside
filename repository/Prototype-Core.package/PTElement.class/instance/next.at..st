navigation
next: aString at: anInteger 
	"Returns element's following sibling (or the index anInteger-th one, if anInteger is specified) that matches the css rule aString. If no aString is provided, all following siblings are considered. If no following sibling matches these criteria, undefined is returned."
	
	self call: 'next' withArguments: (self rule: aString at: anInteger)