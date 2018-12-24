rendering
renderHeaderOn: html
	html tableHead: [
		html tableRow: [
			html tableData.
			html tableHeading: 'Count'.
			html tableHeading: 'Total Time'.
			html tableHeading: 'Avg. Time' ] ]