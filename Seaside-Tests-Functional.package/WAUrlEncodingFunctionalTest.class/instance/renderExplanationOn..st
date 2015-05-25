rendering
renderExplanationOn: html
	html paragraph: 'This tests whether url encoding works.'.
	html unorderedList: [
		html listItem: [
			html text: 'Go to the '.
			html anchor
				url: 'http://www.columbia.edu/kermit/utf8.html';
				with: 'UTF-8 Sampler'.
			html text: ' and select some "foreign" text.' ].
		html listItem: 'Copy and paste it into the urlencoded text field below and click the submit button.'.
		html listItem: 'The text should be displayed below "Input", "Parameter" and "Path" without any error.'.
		html listItem: 'The text may appear in the address bar of the browser.'.
		html listItem: 'Repeat this process. Make sure to pick at least every of these languages: German, Czech, Korean.' ]