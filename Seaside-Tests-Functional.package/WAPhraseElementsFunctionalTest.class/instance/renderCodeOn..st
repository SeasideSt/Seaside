rendering
renderCodeOn: html

	html heading level2; with: '<code>'.

	html paragraph: [
		html text: 'Expressions like '.
		html code: 'a[i++] + b[i++]'.
		html text: ' should not be used, since they cause undefined behavior' ]