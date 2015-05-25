rendering
renderKeyGeneratorOn: html
	html form: [
		html keyGenerator
			callback: [ :k | key := k ].
		html submitButton ]