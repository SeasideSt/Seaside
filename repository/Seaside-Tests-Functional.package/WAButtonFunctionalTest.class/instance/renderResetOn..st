rendering
renderResetOn: html
	html heading level2 with: 'Reset'.
	html paragraph: 'Clicking the button should not submit the form and reset the value in "Input"'.
	html button beReset; with: 'Reset'