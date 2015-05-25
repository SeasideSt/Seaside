attributes
attributeAt: aKey put: aValue
	"Set an attribute for the set of matched elements."
	
	self call: 'attr' with: aKey with: aValue