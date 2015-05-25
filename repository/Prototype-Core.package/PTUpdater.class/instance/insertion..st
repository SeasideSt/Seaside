options
insertion: anInsertion
	"By default, Element.update is used, which replaces the whole contents of the container with the response text. You may want to instead insert the response text around existing contents. You just need to pass a valid Insertion object for this, such as Insertion.Bottom."

	self options at: 'insertion' put: anInsertion