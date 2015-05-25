rendering
renderTableFooterOn: html
	html tableRow: [
		columns do: [ :each |
			self renderFooterForColumn: each on: html ] ]