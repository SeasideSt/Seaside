rendering
renderContentOn: html

	self renderDateSelectorsOn: html.
	html horizontalRule.
	self renderTimeSelectorsOn: html.
	html horizontalRule.
	self renderDateTimeSelectorsOn: html