modifying
insert: anObject 
	"Inserts content before, after, at the top of, or at the bottom of element, as specified by the position property of the argument. If the argument is the content itself, insert will append it to element."
	
	self call: 'insert' with: (self render: anObject)