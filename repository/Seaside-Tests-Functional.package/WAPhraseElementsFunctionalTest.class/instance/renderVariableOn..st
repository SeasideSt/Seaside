rendering
renderVariableOn: html

	html heading level2; with: '<var>'.

	html paragraph: [
		html text: 'In the simplest case, the command for deleting a file in Unix is'.
		html break.
		html keyboard: 'rm'.
		html space.
		html variable: 'filename' ]