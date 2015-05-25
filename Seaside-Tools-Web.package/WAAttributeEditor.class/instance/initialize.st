initialization
initialize 
	super initialize.
	properties := Dictionary new.
	self hasAdvancedAttributes: self hasAdvancedAttributesDefault.
	self displayAdvancedAttributes: false.
	self collapsed: self collapsedByDefault.
	self showHelp: false
