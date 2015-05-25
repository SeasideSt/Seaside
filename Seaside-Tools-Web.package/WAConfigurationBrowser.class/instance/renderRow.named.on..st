rendering-rows
renderRow: aHandler named: aString on: html
	html tableRow: [
		html tableData: [ self renderRowName: aHandler named: aString on: html ].
		html tableData: [ self renderRowDescription: aHandler on: html ] ]