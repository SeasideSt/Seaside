rendering
renderOverflowActionOn: html
	html tableRow: [
		html tableHeading: [
			html label: 'Overflow Action' ].
		html tableData: [
			html select
				list: WAHashCache overflowActions;
				labels: [ :each |
					overflowActionLabels at: each ifAbsent: [ each ] ];
				on: #overflowAction of: self ] ].
	html tableRow: [
		html tableData
			colSpan: 2;
			with: 'What to do when the maximum number of sessions is reached. Only matters when the maximum size is bigger than 0.' ]