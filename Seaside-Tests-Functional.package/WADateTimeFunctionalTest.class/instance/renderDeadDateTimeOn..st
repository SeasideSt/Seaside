rendering
renderDeadDateTimeOn: html
	html heading
		level: 3;
		with: 'Div with #dateInput and #timeInput, no callback'.
	html form: [
		html div: [
			html dateInput value: Date today.
			html space: 10.
			html timeInput withSeconds; with: Time now.
			html break.
			html withLineBreaks: 'The year portion of the date should be visible.
				The seconds portion of the time should be visible.
				Exactly one date and one time selector should be visible.' ] ]