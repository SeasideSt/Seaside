accessing
attributeSelectors
	^ attributeSelectors ifNil: [ attributeSelectors := self findAttributeSelectors ]