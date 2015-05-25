rendering
renderContentOn: html
	html table: [
		html tableHead: [ self renderTableHeaderOn: html ].
		html tableFoot: [ self renderTableFooterOn: html ].
		html tableBody: [ self renderRowsOn: html ] ]