tests
testCircular
	"Circular ancestry graphs are not allowed."
	| first second third |
	first := WAUserConfiguration new.
	second := WAUserConfiguration new
		addParent: first;
		yourself.
	third := WAUserConfiguration new
		addParent: second;
		yourself.
	self 
		should: [ first addParent: third ]
		raise: Error.
	self 
		should: [ first addParent: first ]
		raise: Error