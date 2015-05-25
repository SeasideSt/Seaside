decorations
| anObject 
	"Combine the receiver and anObject with a logical OR."
	
	self addDecoration: (JSBinary new operator: '||'; statement: anObject)