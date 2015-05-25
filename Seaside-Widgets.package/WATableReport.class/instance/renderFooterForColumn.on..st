rendering
renderFooterForColumn: aColumn on: html
	html tableData
		class: aColumn cssClass;
		with: (aColumn totalForRows: rows)