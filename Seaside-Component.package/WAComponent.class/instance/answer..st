delegation
answer: anObject
	"Give back control back to the component from which the receiver was called.
	When returning, a component can additionally return anObject to the caller."

	self decoration handleAnswer: anObject