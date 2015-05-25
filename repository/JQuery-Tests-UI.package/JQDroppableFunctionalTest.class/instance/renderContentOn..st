rendering
renderContentOn: html
	self renderInstructionsOn: html.
	self renderInventoryOn: html.
	self renderSelectedOn: html