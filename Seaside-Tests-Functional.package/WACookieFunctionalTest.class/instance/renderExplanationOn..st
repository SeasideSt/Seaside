rendering
renderExplanationOn: html
	html unorderedList: [
		self renderFirefoxOn: html.
		self renderSafariOn: html.
		self renderOperaOn: html.
		self renderRemoveOn: html ]