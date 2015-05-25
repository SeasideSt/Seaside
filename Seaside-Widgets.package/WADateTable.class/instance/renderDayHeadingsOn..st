rendering
renderDayHeadingsOn: html
	self renderHeadingSpacerOn: html.
	self
		datesDo: [ :date |
			html tableHeading
				class: 'DayHeading';
				with: date dayOfMonth ]
		separatedBy: [ self renderHeadingSpacerOn: html ]