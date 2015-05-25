rendering
renderAcronymOn: html

	html heading level2; with: '<acronym>'.

	html paragraph: [
		html acronym
			title: 'Federal Bureau of Investigation';
			with: 'F.B.I.' ]