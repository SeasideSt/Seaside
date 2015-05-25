rendering
renderCloseButtonOn: html
	html anchor
		title: 'Close';
		callback: [ self decoratedComponent answer: nil ];
		with: [ html html: '&times;' ]