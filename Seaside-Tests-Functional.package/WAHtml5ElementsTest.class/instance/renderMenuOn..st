rendering
renderMenuOn: html
	html heading level2; with: '<menu>'.

	html menu: [
		html command beRadio; label: 'Do 1st Command'.
		html command beRadio; label: 'Do 2nd Command'.
		html command beRadio; label: 'Do 3rd Command' ]