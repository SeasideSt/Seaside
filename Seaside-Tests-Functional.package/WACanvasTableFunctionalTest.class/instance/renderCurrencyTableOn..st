rendering
renderCurrencyTableOn: html
	html table
 		summary: 'This table shows exchange rates against the Swiss Franc';
		with: [
			html tableCaption: 'Currencies against Swiss Franc (CHF)'.
			html tableColumnGroup.
			html tableColumnGroup width: '100px'; align: 'char'; character: $..
			self renderCurrencyTableHeadOn: html.
			self renderCurrencyTableBodyOn: html ]