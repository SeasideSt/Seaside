rendering
renderLocaleSelectionOn: html
	html paragraph: 'Select a locale below2' seasideTranslated.
	html unorderedList: [
		self availableLocales do: [ :each |
			html listItem: [
				html anchor
					callback: [ self session locale: each ];
					with: [ 
						html translate: 'locale2' to: each.
						html space.
						html text: each greaseString ] ] ] ]