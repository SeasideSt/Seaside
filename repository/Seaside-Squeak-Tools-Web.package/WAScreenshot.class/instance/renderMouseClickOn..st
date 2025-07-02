rendering
renderMouseClickOn: html
	html div: [
		html map
			title: 'Click here';
			callback: [ :point | self click: point + self offset ];
			with: [
				| form |
				form := self form.
				html image
					width: (form width / Display uiScaleFactor) greaseInteger;	
					height: (form height / Display uiScaleFactor) greaseInteger;
					form: form ] ]
