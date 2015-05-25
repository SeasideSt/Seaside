effects
fade: aDuration to: anNumber callback: anObject
	"Adjust the opacity of the matched elements."
	
	self call: 'fadeTo' with: aDuration with: anNumber with: anObject asFunction