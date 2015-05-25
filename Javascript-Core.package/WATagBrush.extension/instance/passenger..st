*javascript-core
passenger: anObject
	"Assign a passenger object to the receiver. This is used to keep a mapping between DOM elements and Smalltalk objects. Note, that to we are required to assign a numeric id to the reciever in order to keep the mapping between DOM element and Smalltalk object."

	canvas callbacks registerPassenger: anObject named: self ensureId