decorations
& anObject 
	"Combine the receiver and anObject with a logical AND."
	
	self addDecoration: (JSBinary new operator: '&&'; statement: anObject)