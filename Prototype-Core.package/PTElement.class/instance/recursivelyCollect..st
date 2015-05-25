enumerating
recursivelyCollect: aString 
	"Recursively collects elements whose relationship is specified by aString. aString has to be a property of element that points to a single DOM node. Returns an array of extended elements."
	
	^ self call: 'recursivelyCollect' with: aString; enumerator