rendering
renderRowNumber: index item: row on: html
	html tableRow
		style: 'background-color: ' , (self colorForRowNumber: index);
		with: [
			columns do: [ :each |
				self renderColumn: each row: row on: html ] ]