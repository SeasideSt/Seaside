decorations
condition: anObject  else: otherObject
	"Treat anObject as a condition to the execution of the receiver."
	
	self addDecoration: (JSConditionElse on: anObject else: otherObject)