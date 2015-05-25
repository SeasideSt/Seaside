modifying
update: anObject 
	"Replaces the content of element with the provided newContent argument and returns element."
	
	self call: 'update' with: (self render: anObject)