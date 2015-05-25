data
dataAt: aKey put: aValue
	"Store arbitrary data associated with the matched elements."
	
	self call: 'data' with: aKey with: aValue