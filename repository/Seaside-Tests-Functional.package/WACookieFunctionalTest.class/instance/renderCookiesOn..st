rendering
renderCookiesOn: html
	self cookies do: [ :each |
		html tableRow: [
			html tableData: each key.
			html tableData: each value.
			html tableData: each path.
			html tableData: each domain.
			html tableData: each ports.
			html tableData: [
				html submitButton
					callback: [ self remove: each ];
					text: 'remove' ] ] ]