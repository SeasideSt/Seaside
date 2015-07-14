testing
isAttributeFoundOn: aConfiguration 
	^ (self isAttributeLocalOn: aConfiguration) or: [ self isAttributeInheritedOn: aConfiguration ]