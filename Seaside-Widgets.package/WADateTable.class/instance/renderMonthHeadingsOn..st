rendering
renderMonthHeadingsOn: html
	self monthsAndLengthsDo: [ :month :length |
		self renderHeadingSpacerOn: html.
		html tableHeading
			colSpan: length;
			class: 'MonthHeading';
			with: [
				html text: month name.
				html space.
				html text: month year ] ]