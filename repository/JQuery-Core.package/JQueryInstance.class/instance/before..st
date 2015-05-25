modifying
before: aRenderable 
	"Insert content, specified by the parameter, before each element in the set of matched elements."
	
	self call: 'before' with: (self render: aRenderable)