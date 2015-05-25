accessors
map: anObject
	"Pass each element in the current matched set through a function, producing a new jQuery object containing the return values.."
	
	self call: 'map' with: anObject asFunction