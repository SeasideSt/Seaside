rendering
renderConfigurationOn: html
	html form: [ 
		html paragraph: [
			
			self renderTypeOn: html.
			html space.
			self renderStartOn: html.
			html space.
			self renderReversedOn: html.
			html space.
			html submitButton ] ]