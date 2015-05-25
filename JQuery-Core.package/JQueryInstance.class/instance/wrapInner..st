modifying
wrapInner: aRenderable 
	"Wrap an HTML structure around the content of each element in the set of matched elements."
	
	self call: 'wrapInner' with: (self render: aRenderable)