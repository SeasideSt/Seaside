rendering
renderExplanationOn: html
	html paragraph: [
		html text: 'This is a functional test for WAValidationDecoration.'.
		html orderedList: [
			html listItem: 'Clicking on ''Start'' should take you to a new page with two links, "Fail validation" and "Suceed validation"'.
			html listItem: 'Clicking on "Fail validation" should display "Validation Failed!" above the two links'.
			html listItem: 'Clicking on "Suceed validation" should just display "Validation Suceeded!" and then take you back to this page' ] ]