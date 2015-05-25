actions
toggleAdvanced
	self displayAdvancedAttributes: self displayAdvancedAttributes not.
	self displayAdvancedAttributes
		ifTrue: [ self collapsed: false ]