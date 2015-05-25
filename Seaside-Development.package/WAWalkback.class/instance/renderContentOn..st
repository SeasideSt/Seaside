rendering
renderContentOn: html
	self renderHeadingOn: html.
	self renderToolsOn: html.
	self renderExceptionOn: html.
	self renderStackOn: html