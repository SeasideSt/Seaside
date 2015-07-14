testing
isPrimitiveType: anObject
	"Return a boolean indicating whether anObject is a primitive type in the system.
	Primitive types will not be rendered with a link allowing them to be inspected."

	^ anObject isNumber or: [ #(nil true false) includes: anObject ]