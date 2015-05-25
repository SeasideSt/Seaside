rendering
renderKeyboardInputOn: html

	html heading level2; with: '<kbd>'.

	html paragraph: [
		html text: 'Finally, type '.
		html keyboard: 'logout'.
		html text: ' and press the return key.' ]