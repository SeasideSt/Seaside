rendering
renderContentOn: html
	html anchor
		class: self cssClass;
		url: (html actionUrl
			withField: 'terminate');
		with: self label