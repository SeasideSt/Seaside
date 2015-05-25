rendering
renderRowForWeek: initialDay on: html
	html tableRow: [
		0 to: 6 do: [ :each |
			self renderCellForDate: (initialDay addDays: each) on: html ] ]