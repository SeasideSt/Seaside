rendering
renderCurrencyTableBodyOn: html
	html tableBody 
		title: 'Table body';
		with: [
			self exchangeRates do: [ :each |
				html tableRow: [
					html tableHeading: each first.
					html tableData align: 'char'; character: $.;
						with: each second ] ] ]