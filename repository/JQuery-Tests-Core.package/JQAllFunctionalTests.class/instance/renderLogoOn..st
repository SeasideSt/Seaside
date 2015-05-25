rendering
renderLogoOn: html
	html heading level: 1; class: 'logo'; with: [
		html anchor
			title: self title;
			callback: [ contents := default ];
			with: [ html span: self title ] ]