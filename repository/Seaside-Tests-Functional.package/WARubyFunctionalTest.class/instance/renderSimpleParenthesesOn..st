rendering
renderSimpleParenthesesOn: html
	html heading level2; with: 'Simple ruby markup with parentheses'.
	html ruby: [
		html text: 'WWW'.
		html rubyParentheses: '('.
		html rubyText: 'World Wide Web'.
		html rubyParentheses: ')' ]