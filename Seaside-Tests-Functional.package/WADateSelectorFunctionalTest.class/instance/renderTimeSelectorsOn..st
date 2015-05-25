rendering
renderTimeSelectorsOn: html 
	html heading
		level3;
		with: 'Times'.
	html form: [
		html table: [
			html tableRow: [
				html
					tableData: 'From';
					tableData: beginTime ].
			html tableRow: [
				html
					tableData: 'To';
					tableData: endTime ] ].
		html div: [
			html submitButton
				callback: [
					self 
						inform: (endTime time subtractTime: beginTime time) asSeconds greaseString , ' seconds(s)'
						onAnswer: [ ] ];
				text: 'Compute duration' ] ]