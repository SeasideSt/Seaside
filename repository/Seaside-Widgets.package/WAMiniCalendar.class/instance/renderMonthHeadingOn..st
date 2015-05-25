rendering
renderMonthHeadingOn: html
	html form: [
		html div: [
			html select
				list: (1 to: 12);
				on: #monthIndex of: self;
				labels: [ :index | Date nameOfMonth: index ].
			html textInput
				maxLength: 4;
				on: #year of: self.
			html submitButton text: 'Refresh' ] ]