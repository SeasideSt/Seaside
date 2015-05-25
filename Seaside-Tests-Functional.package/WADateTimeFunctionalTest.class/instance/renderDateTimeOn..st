rendering
renderDateTimeOn: html 
	html heading
		level3;
		with: 'Form with #dateInput and #timeInput'.
	html form
		defaultAction: [ message := 'Default action: ' , date greaseString , ' ' , time greaseString ];
		with: [
			html div: [
				" use #callback: and #with: "
				html dateInput
					callback: [ :value | self date: value ];
					with: self date.
				html space: 10.
				" use #on:of: "
				html timeInput
					withSeconds;
					on: #time of: self.
				html break.
				html text: message.
				html break.
				html submitButton 
					callback: [ message := 'Button action: ' , date greaseString , ' ' , time greaseString ] ] ]