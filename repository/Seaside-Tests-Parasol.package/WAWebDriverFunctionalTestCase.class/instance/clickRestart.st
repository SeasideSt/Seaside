helpers
clickRestart

	| button |
	button := driver findElementByCSSSelector: 'input[type="submit"]'.
	self assert: (button getAttribute: 'value') equals: 'Restart'.
	button click