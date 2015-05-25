rendering
renderHeaderOn: html
	html div id: 'header'; with: [
		html image
			id: 'logo';
			url: SUAllTestLibrary / #logoGif;
			altText: self title ]