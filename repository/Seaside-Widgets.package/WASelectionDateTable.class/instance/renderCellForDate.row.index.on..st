rendering
renderCellForDate: aDate row: anObject index: aNumber on: html
	html tableData
		style: 'text-align: center; background-color: ', (self colorForDate: aDate rowIndex: aNumber);
		with: [
			html anchor
				callback: [ self selectDate: aDate rowIndex: aNumber ];
				with: (cellBlock value: anObject value: aDate) ]