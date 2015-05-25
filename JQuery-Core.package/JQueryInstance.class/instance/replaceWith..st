modifying
replaceWith: aRenderable 
	"Replace each element in the set of matched elements with the provided new content."
	
	self call: 'replaceWith' with: (self render: aRenderable)