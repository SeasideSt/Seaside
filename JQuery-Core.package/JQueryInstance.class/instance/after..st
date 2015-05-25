modifying
after: aRenderable 
	"Insert content, specified by the parameter, after each element in the set of matched elements."
	
	self call: 'after' with: (self render: aRenderable)