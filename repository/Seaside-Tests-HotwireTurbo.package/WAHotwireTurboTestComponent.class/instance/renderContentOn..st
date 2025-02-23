rendering
renderContentOn: html

	html paragraph: 'I am wrapped in a turboframe.'.
	html anchor
		callback: [ self turboCall: WAHotwireTurboCalledTestComponent new ];
		with: 'Clicking me should only update my surrounding turboframe.'