rendering
renderTimeOn: html
	html heading level2; with: '<time>'.
	
	html paragraph: [
		html text: 'Our first date was '.
		html time
			datetime: '2006-09-23';
			with: 'a saturday'.
		html text: '.' ].
	
	html paragraph: [
		html text: 'We stopped talking at '.
		html time
			datetime: '2006-09-24 05:00 -7';
			with: '5am the next morning'.
		html text: '.' ].
	
	html paragraph: [
		html text: 'Many people get up at '.
		html time: '08:00'.
		html text: '.' ]