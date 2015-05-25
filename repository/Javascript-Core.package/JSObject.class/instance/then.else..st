decorations
then: anObject else: anotherObject 
	"Evaluates anObject if the receiver treated as a boolean evaluates to true, otherwise evaluate anotherObject."
	
	self addDecoration: (JSIfThenElse new
		trueStatement: anObject;
		falseStatement: anotherObject)