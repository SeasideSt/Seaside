rendering
renderLogoOn: html
	html anchor
		url: (WAUrl new 
			host: 'www.seaside.st';
			yourself);
		with: [ html div class: 'smallLogo' ]