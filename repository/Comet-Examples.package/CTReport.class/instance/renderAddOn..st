rendering
renderAddOn: html
	html anchor
		url: '#';
		" append a new row to the table "
		onClick: (html jQuery ajax script: [ :script |
			script add: ((script jQuery: 'table') append: [ :renderer |
				renderer tableRow: [
					self
						renderRowEdit: CTReportItem new
						action: [ :item | self items add: item ]
						on: renderer ] ]) ]);
		with: 'Add Item'