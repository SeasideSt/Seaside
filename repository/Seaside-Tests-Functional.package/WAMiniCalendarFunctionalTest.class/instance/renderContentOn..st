rendering
renderContentOn: html
	html render: calendar.

	html div: [
		html strong: 'selected:'.
		html space.
		html render: calendar date ]