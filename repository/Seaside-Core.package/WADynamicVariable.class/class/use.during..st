evaluating
use: anObject during: aBlock
	"Set the dynamic value of the receiver to anObject during the evaluation of aBlock."
	
	^ aBlock on: self do: [ :notification | notification resume: anObject ]