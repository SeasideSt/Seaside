rendering
renderDateSelectorsOn: html 
	html heading
		level3;
		with: 'Dates'.
	html form id: #dateForm; with: [
		html table: [
			html tableRow
				class:'from';
				with: [
					html
						tableData: 'From';
						tableData: beginDate ].
			html tableRow
				class:'to';
				with: [
					html
						tableData: 'To';
						tableData: endDate ] ].
		html div: [
			html submitButton
				callback: [
					self 
						inform: (endDate date - beginDate date) days greaseString , ' day(s)'
						onAnswer: [ ] ];
				text: 'Compute duration' ] ]