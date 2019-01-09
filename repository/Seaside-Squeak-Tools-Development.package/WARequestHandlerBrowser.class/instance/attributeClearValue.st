actions
attributeClearValue

	self attribute ifNotNil: [:a | 
		self configuration removeExpressionAt: a key.
		self changed: #attribute.
		self changed: #groupedAttributes.
		self changed: #expandRootsRequested].