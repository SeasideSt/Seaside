rendering
renderContentOn: html
	html select
		list: self months;
		on: #month of: self;
		labels: [ :each | self labelForMonth: each ].

	html select
		list: self days;
		on: #day of: self;
		labels: [ :each | self labelForDay: each ].

	html select
		list: self yearRange;
		on: #year of: self;
		labels: [ :each | self labelForYear: each ].

	self dateIsValid ifFalse: [ self renderValidationErrorOn: html ]