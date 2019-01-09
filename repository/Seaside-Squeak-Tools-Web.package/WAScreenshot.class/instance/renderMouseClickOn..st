rendering
renderMouseClickOn: html
	html div: [
		html map
			title: 'Click here';
			callback: [ :point | self click: point + self offset ];
			with: [ html image form: self form ] ]