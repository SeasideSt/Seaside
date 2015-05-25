modifying
insert: anObject position: aString 
	"Inserts anObject before, after, at the top of, or at the bottom of element."
	
	self call: 'insert' with: (Dictionary new 
		at: aString put: (self render: anObject); 
		yourself)