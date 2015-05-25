rendering
renderContentOn: html
	html image
		altText: 'Seaside';
		url: (JQUiAllFunctionalTestsLibrary urlOf: #seastarPng);
		script: (html jQuery new draggable opacity: 0.75)