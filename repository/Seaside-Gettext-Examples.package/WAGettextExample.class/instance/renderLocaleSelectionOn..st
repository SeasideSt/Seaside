rendering
renderLocaleSelectionOn: html
	html unorderedList: [
		self availableLocales do: [ :each |
			html listItem: [
				html anchor
					callback: [ self session locale: each ];
					with: [ html translate: 'locale' to: each ] ] ] ]