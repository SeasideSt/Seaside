decorations
setTimeout: aDuration 
	"Evaluates the receiver after aDuration."
	
	self addDecoration: (JSTimeout duration: aDuration)