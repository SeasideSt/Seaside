rendering
renderContentOn: html
	self renderExplanationOn: html.

	html form: [
		html table: [
			self renderHeadingsOn: html.
			self renderCookiesOn: html.
			self renderInputOn: html ] ]