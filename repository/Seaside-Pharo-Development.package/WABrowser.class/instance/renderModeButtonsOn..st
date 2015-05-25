rendering
renderModeButtonsOn: html
	html form class: 'mode'; with: [
		html div: [
			html submitButton
				callback: [ self showInstance ];
				value: 'instance'.
			html submitButton
				callback: [ self showHelp ];
				value: 'help'.
			html submitButton
				callback: [ self showClass ];
				value: 'class' ] ]