rendering
renderSubmitOn: html
	html heading level2 with: 'Submit'.
	html paragraph: 'Clicking the button should submit the form and update the value in "Value:" with the value in "Input"'.
	html button with: 'Submit'