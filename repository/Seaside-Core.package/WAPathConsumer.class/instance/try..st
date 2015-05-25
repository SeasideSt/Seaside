accessing
try: aString
	"See if the next element in the stream matches aString.
	If it does, consume the element and return true.
	If it does not or we are at the end of the stream, simply return false."

	(self atEnd or: [ self peek ~= aString ])
		ifTrue: [ ^ false ].
	self next.
	^ true