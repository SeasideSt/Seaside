rendering
renderInstructionsOn: html
	html paragraph: 'This test requires JavaScript. The list boxes should behave normally when used with the submit button. The link will try to submit the value C to the number listbox and the value 3 to the letter list box.'.
	html paragraph: 'Current behaviour results in C and 3 being selected in the appropriate lists. What is essential, however, is only that the values are not selected in the wrong list because this might allow an attacker to trick seaside into running methods on the wrong objects.'