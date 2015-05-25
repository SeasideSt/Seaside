decorations
assign: anObject 
	"Assign anObject to the receiver."
	
	self addDecoration: (JSAssignment new object: anObject)