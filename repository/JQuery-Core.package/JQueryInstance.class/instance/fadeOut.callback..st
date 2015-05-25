effects
fadeOut: aDuration callback: anObject
	"Hide the matched elements by fading them to transparent."
	
	self call: 'fadeOut' with: aDuration with: anObject asFunction