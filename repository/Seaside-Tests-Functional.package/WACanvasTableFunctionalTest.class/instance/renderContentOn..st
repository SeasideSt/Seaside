rendering
renderContentOn: html
	html div
		class: 'wacanvastabletest';
		with: [
			self renderEntityTableOn: html.
			self renderCurrencyTableOn: html ]