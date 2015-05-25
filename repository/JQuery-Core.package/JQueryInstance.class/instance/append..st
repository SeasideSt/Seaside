modifying
append: aRenderable 
	"Insert content, specified by the parameter, to the end of each element in the set of matched elements."
	
	self call: 'append' with: (self render: aRenderable)