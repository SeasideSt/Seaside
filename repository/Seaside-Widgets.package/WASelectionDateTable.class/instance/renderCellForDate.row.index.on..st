rendering
renderCellForDate: aDate row: anObject index: aNumber on: html
	html tableData
		style: 'background-color: ', (self colorForDate: aDate rowIndex: aNumber);
		align: 'center';
		with: [
			html anchor
				callback: [ self selectDate: aDate rowIndex: aNumber ];
				with: (cellBlock value: anObject value: aDate) ]