rendering
renderContentOn: html
	self renderExplanationOn: html.
	html form: [
		html table: inputElements.
		html div: [
			self renderRequestBodyOn: html.
			"div for validation"
			html submitButton ] ]