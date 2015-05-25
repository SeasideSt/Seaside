rendering-parts
renderDescriptionOn: html
	html paragraph: [
		html text: 'Here are a few common settings you might want to change. Once you''re ready for more, you can jump over to the '.
		html anchor
			url: '/config';
			with: 'advanced configuration tool'.
		html text: '.' ]