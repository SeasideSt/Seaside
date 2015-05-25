decorations
assignLocalTo: aString 
	"Assign the receiver to a local variable aString."
	
	self addDecoration: (JSAssignLocal named: aString)