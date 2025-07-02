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
					width: (form width / self uiScaleFactor) greaseInteger;	
					height: (form height / self uiScaleFactor) greaseInteger;
					form: form ] ]