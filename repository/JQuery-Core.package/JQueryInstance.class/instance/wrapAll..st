modifying
wrapAll: aRenderable 
	"Wrap an HTML structure around all elements in the set of matched elements."
	
	self call: 'wrapAll' with: (self render: aRenderable)