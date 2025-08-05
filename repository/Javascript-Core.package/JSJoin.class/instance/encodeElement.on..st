encoding
encodeElement: anObject on: aRenderer

	(anObject isKindOf: Association)
		ifTrue: [
			self encodeAssociation: anObject on: aRenderer ]
		ifFalse: [
			"We assume that the element is already URL encoded if this is not an association."
			aRenderer render: anObject ]