rendering
renderContentOn: html
	html div class: 'errorTest'; with: [
		self renderHandlerConfigurationOn: html.
		self renderPartsOn: html ]