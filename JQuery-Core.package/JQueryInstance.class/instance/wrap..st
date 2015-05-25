modifying
wrap: aRenderable 
	"Wrap an HTML structure around each element in the set of matched elements."
	
	self call: 'wrap' with: (self render: aRenderable)