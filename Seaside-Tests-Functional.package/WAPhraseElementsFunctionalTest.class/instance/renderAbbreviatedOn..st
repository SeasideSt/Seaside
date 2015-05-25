rendering
renderAbbreviatedOn: html

	html heading level2; with: '<abbr>'.

	html paragraph: [
		html abbreviated
			title: 'World Wide Web';
			with: 'WWW' ]