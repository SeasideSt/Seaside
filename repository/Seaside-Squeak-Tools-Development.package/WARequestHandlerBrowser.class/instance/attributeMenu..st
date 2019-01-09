configuration - attributes
attributeMenu: aMenu

	self attribute ifNotNil: [:a |
		aMenu addList: #(
			('Clear value' attributeClearValue 'Clear the attributes value'))].
	^aMenu