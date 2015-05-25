rendering
renderContentOn: html
	html anchor
		class: self cssClass;
		title: 'Validate XHTML';
		url: 'http://validator.w3.org/check/referer';
		with: self label