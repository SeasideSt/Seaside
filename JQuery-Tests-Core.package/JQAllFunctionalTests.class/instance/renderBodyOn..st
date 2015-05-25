rendering
renderBodyOn: html
	html div class: 'body'; with: [ 
		self renderTestsOn: html.
		self renderMainOn: html.
		html div style: 'clear: both' ]