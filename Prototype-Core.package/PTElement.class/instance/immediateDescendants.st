deprecated
immediateDescendants
	"Collects all of the element's immediate descendants (i.e. children) and returns them as an array of extended elements."
	self 
		greaseDeprecatedApi: 'PTElement>>#immediateDescendants'
		details: 'As of Prototype 1.6, #immediateDescendants has been deprecated in favor of the more concise #childElements.'.
	^ self
		call: 'immediateDescendants';
		enumerator