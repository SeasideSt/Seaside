rendering
renderHeadOn: html
	html div class: 'head'; with: [
		html heading level: 2; with: [
			html anchor
				callback: [ contents := default ];
				with: self heading ].
		html paragraph: self slogan ]