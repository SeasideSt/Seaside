rendering
renderFigureOn: html
	html heading level2; with: '<figure>'.
	html figure: [
		html image url: WATestingFiles / #samplePng; altText: 'sample'.
		html figureCaption: 'A Sample Icon' ]