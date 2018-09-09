rendering
renderTimeSelectorsOn: html 
	html heading
		level3;
		with: 'Times'.
	html form id: #timeForm; with: [
		html table: [
			html tableRow
				class:'from';
				with:[ 
					html
						tableData: 'From';
						tableData: beginTime ].
			html tableRow
				class:'to';
				with:[
					html
						tableData: 'To';
						tableData: endTime ] ].
		html div: [
			html submitButton
				callback: [
					self 
						inform: (endTime time subtractTime: beginTime time) asSeconds greaseString , ' second(s)'
						onAnswer: [ ] ];
				text: 'Compute duration' ] ]