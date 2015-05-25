navigation
up: aString at: anInteger 
	"Returns element's first ancestor (or the index anInteger-th one, if anInteger is specified) that matches the css rule aString. If no aString is provided, all ancestors are considered. If no ancestor matches these criteria, undefined is returned."

	self call: 'up' withArguments: (self rule: aString at: anInteger)