rendering
renderContentOn: html
	html select
		list: (0 to: 23);
		on: #hour of: self.
	html select
		list: (0 to: 59);
		on: #minute of: self.
	html select
		list: (0 to: 59);
		on: #second of: self.
	self timeIsValid
		ifFalse: [ self renderValidationErrorOn: html ]