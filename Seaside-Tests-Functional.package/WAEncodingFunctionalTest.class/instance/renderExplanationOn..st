rendering
renderExplanationOn: html
	html unorderedList: [
		html listItem: [
			html text: 'Go to the '.
			html anchor
				url: 'http://www.columbia.edu/kermit/utf8.html';
				with: 'UTF-8 Sampler'.
			html text: ' and select some "foreign" text.' ].
		html listItem: 'Copy and paste it into the urlencoded text field below and click the submit button.'.
		html listItem: 'The heading, textfield, character field and submitt button should all display the text without any error.'.
		html listItem: 'Submit again without changing anything, again everything should display normally.'.
		html listItem: 'Repeat this process for the multipart field. Make sure to pick at least every of these languages: German, Czech, Korean.' ]