rendering
renderCalendarOn: html
	html tableRow: [
		html tableHeading
			colSpan: 9;
			with: [ self renderMonthNavigationOn: html ] ].
	html tableRow
			class: 'calendarTitle';
			with: [
				self weekDays do: [ :each |
					html tableData
						class: 'weekDay';
						with: each ] ].
	self weeksDo: [ :week | self renderRowForWeek: week on: html ].
	html tableRow: [
		html tableData
			colSpan: 9;
			with: [ self renderYearNavigationOn: html ] ]	

			