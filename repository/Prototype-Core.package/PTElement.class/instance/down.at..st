navigation
down: aString at: anInteger 
	"Returns element's first descendant (or the index anInteger-th one, if anInteger is specified) that matches the css rule aString. If no aString is provided, all descendants are considered. If no descendant matches these criteria, undefined is returned."
	
	self call: 'down' withArguments: (self rule: aString at: anInteger)