rendering
renderDoneOn: html
	html anchor
		class: 'large';
		title: 'Close and return';
		callback: [ self answer ];
		with: 'Close'