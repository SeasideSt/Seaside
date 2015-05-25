rendering
renderSampleOn: html

	html heading level2; with: '<samp>'.

	html paragraph: [
		html text: 'If you select the ''champion'' option, you will receive the message '.
		html sample: 'The monkey is not a caterpillar'.
		html text: '.' ]