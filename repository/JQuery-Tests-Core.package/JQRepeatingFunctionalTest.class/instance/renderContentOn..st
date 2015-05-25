rendering
renderContentOn: html
	html paragraph
		script: (html jQuery this load
			html: [ :r | self renderTimeOn: r ];
			interval: 1 seconds);	
		with: [ self renderTimeOn: html ]