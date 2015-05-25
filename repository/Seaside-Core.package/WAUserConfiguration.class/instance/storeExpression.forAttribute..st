values
storeExpression: anAttributeExpression forAttribute: anAttribute
	self clearSearchContexts.
	^ expressions at: anAttribute key put: anAttributeExpression