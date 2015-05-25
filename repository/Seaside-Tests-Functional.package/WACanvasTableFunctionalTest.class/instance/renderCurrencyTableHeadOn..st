rendering
renderCurrencyTableHeadOn: html
	html tableHead
		title: 'Table header';
		with: [
			html tableRow: [
				html tableHeading: 'Currency'.
				html tableHeading: 'Rate' ] ]